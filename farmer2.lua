local tws = game:GetService("TweenService")
local vhrp = Instance.new("Part")
vhrp.Anchored = true
      
game:GetService("RunService").Heartbeat:Connect(function()
  for i, v in pairs(workspace:WaitForChild("DroppedItems"):GetDescendants()) do
    if v:FindFirstChildOfClass("ProximityPrompt") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      --[[local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
      tws:Create(vhrp, TweenInfo.new(1), {["CFrame"] = CFrame.new(v.Position + Vector3.new(math.random(-5, 5), 3, math.random(-5, 5)))}):Play()
      task.spawn(function()
        for i = 1, 60 do
          task.wait()
          hrp.CFrame = vhrp.CFrame
        end
      end)
      local prox = v:FindFirstChildOfClass("ProximityPrompt")
      ]]
                        
      prox.RequiresLineOfSight = false
      prox.MaxActivationDistance = 10000
      prox:InputHoldBegin()
      task.wait()
      prox:InputHoldEnd()
      task.wait()
    end
  end
end)
