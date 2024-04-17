local tws = game:GetService("TweenService")
local vhrp = Instance.new("Part")
vhrp.Anchored = true
      
game:GetService("RunService").Heartbeat:Connect(function()
  for i, v in pairs(workspace:WaitForChild("DroppedItems"):GetDescendants()) do
    if v:FindFirstChildOfClass("ProximityPrompt") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      local prox = v:FindFirstChildOfClass("ProximityPrompt")
      local hrp = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
      local pos = CFrame.new(hrp.CFrame, v.CFrame)

      repeat
            pos += pos.LookVector * 3
            hrp.CFrame = pos
            wait()
      until (hrp.Position - v.Position).Magnitude < 8

      if fireproximityprompt then
            fireproximityprompt(prox, 2.48)
            print(fireproximityprompt)
      else
            prox.RequiresLineOfSight = false
            prox.MaxActivationDistance = 10000
            prox:InputHoldBegin()
            task.wait()
            prox:InputHoldEnd()
            task.wait()
            print(prox)
      end
    end
  end
end)
