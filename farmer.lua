local goal = nil
local goalfound = true
local frames = 0
local performance = {}

workspace.DescendantAdded:Connect(function(child)
	if child:FindFirstChildOfClass("ProximityPrompt") and child:IsA("BasePart") and child.Anchored == false then
		goal = child
		goalfound = false
	end
end)

local function fireproximityprompt(prox: ProximityPrompt)
	if not prox then
		return
	end
	
	repeat
		prox.RequiresLineOfSight = false
		prox.MaxActivationDistance = math.huge
		prox:InputHoldBegin()
		task.wait()
		prox:InputHoldEnd()
		task.wait()
	until not prox.Parent
end

local function logperformance(score)
	table.insert(performance, score)
	
	if #performance % 10 == 0 then
		local avg = 0
		
		for i, v in performance do
			avg += v
		end
		
		avg = avg / #performance
		
		print("Performance report: [",#performance,"]",avg)
	end
end

task.spawn(function()
	while task.wait(1/30) do
		local char = game:GetService('Players').LocalPlayer.Character
		if not char then
			continue
		end
		if not goal and char then
			local hrp: Part = char:FindFirstChild("HumanoidRootPart")
			if not hrp then
				continue
			end
			
			hrp.AssemblyLinearVelocity = Vector3.one * 10
			
			return
		end
		
		local hrp: Part = char:FindFirstChild("HumanoidRootPart")
		if not hrp or goalfound then
			continue
		end

		for i, v in workspace:GetDescendants() do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		
		hrp.Anchored = false
		local goaldirection = CFrame.new(hrp.Position, goal.Position)
		local goaldistance = (hrp.Position - goal.Position).Magnitude
		
		frames += 1
		
		if goaldistance > 10 then
			hrp.CFrame += goaldirection.LookVector * 8
			hrp.AssemblyLinearVelocity = Vector3.yAxis * -10
		else
			hrp.CFrame = goal.CFrame
			hrp.AssemblyLinearVelocity = Vector3.zero
			logperformance(100 - math.round(frames * 1.5))
			
			frames = 0
			hrp.Anchored = true
			task.wait(0.2)
			fireproximityprompt(goal:FindFirstChildOfClass("ProximityPrompt"))
			goalfound = true
		end
	end
end)

task.spawn(function()
	while task.wait() do
		local char = game:GetService('Players').LocalPlayer.Character
		if not char then
			continue
		end
		
		if char:FindFirstChild("Humanoid") then
			char.Humanoid:ChangeState(({Enum.HumanoidStateType.Seated, Enum.HumanoidStateType.Running})[math.random(1, 2)])
		end
	end
end)
