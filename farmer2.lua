blacklist = [[

Rules:
1. Exploiting: [Blacklist]
2. Abusing God's hand [Permanent ban]
3. Being toxic / annoying e.g. "i know it brings you pain but it only makes me feel a bit better" [Ban]
3.1. If you play the game normally, you don't break the rules even if it gets annoying
4. Extreme toxicity e.g. threats, "mad?", "L" etc. [Permanent Ban]
5. Teaming, supporting other blacklisted rulebreakers, being toxic or teaming in result [Permanent Ban]

Lines starting with $ are rules (blacklists)

-- $0;RuslanDrab;rule 2, 3, 4 [ib];SemiPurgatory
-- $0;RobloxKid4Life2017;rule 4 [ib];SemiPurgatory
-- $1;Sashaviki2;rule 3, 5 [ib];SemiPurgatory
-- $1;MushyDrgon;rule 3, 5 [ib];SemiPurgatory
-- $1;gogochi2010;rule 3 [ib];SemiPurgatory
-- $1;2gonzalito2;rule 3 [ib];SemiPurgatory
-- $1;Bendy_inkmachine58;rule 3 [ib];SemiPurgatory
UNBANNED $1;WAYON_IDK;rule 4;SemiPurgatory
$1;SemiPurgatory;;

]]
parsedblacklist = {}
for i, v in pairs(blacklist:split("\n")) do
	if v:sub(0, 1) == "$" then
		table.insert(parsedblacklist, v:split(";"))
	end
end
print(parsedblacklist)

---------------------------------------------------------------------------
---------------------------------------------------------------------------

local success, err = pcall(function()
	local function findBlacklistedUser(user: string)
		for i, v in pairs(parsedblacklist) do
			if v[2] == user then
				return v
			end
		end
	end

	local function getChar(plr: Player?)
		local plr = plr or game:GetService("Players").LocalPlayer

		return plr.Character
	end

	local function getRoot(char: Model | Player)
		if not char or char:IsA("Player") then
			char = getChar(char)
		end

		if not char then
			return
		end

		return char:FindFirstChild("HumanoidRootPart") or
			char:FindFirstChild("Torso") or
			char:FindFirstChild("LowerTorso")
	end

	local function slap(plr: Player, event: string, tp: Vector3?)
		local e = "Dangerous slap!"
		local opp = getRoot(plr)
		local me = getRoot()

		if tp and me then
			me.CFrame = CFrame.new(opp.Position + tp, opp.Position)
		end

		workspace.REvents[event]:FireServer(plr, "", "", "", "")
	end

	local function chat(msg: string)
		return game:GetService("ReplicatedStorage").ClassicChatSystemChatEvents.Chat:InvokeServer(msg)
	end

	while task.wait(0.1) do
		local root = getRoot()

		if not root then
			continue
		end

		local hum = root.Parent.Humanoid
		local bptool = game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool")

		if not bptool and not root.Parent:FindFirstChildOfClass("Tool") then
			root.CFrame = workspace.Scripts.GiverZone.CFrame
			task.wait(1)
		end

		if not root.Parent:FindFirstChildOfClass("Tool") then
			repeat
				bptool = game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
				task.wait()
			until bptool

			bptool.Parent = root.Parent
		end

		for _, p in pairs(game:GetService("Players"):GetPlayers()) do
			-- local bl = findBlacklistedUser(p.Name)

			-- if bl then
			-- 	local s, e = pcall(function()
			-- 		hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
			-- 		local opp = getRoot(p)
			-- 		slap(p, "DefaultSlap", Vector3.xAxis * 3)
			-- 		root.AssemblyLinearVelocity = Vector3.yAxis * 5
			-- 		root.AssemblyAngularVelocity = Vector3.new(math.random(), math.random(), math.random()) * 10
			-- 		root.CanCollide = false
			-- 		opp:ApplyImpulse(Vector3.yAxis * 16)
			-- 	end)

			-- 	if not s then
			-- 		--chat(e)
			-- 	end

			-- 	wait()
			-- end
			slap(p, "DefaultSlap", Vector3.new(math.random(), math.random(), math.random()) * 10)
			hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
			wait()
		end
	end
end)

if not success then
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	gui.Enabled = true
	gui.DisplayOrder = 10000

	local label = Instance.new("TextLabel")
	label.Parent = gui
	label.Size = UDim2.fromScale(1, 1)
	label.TextScaled = true
	label.Text = err
end
