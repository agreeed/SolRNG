game:GetService("RunService").Heartbeat:Connect(function()
  for i, v in pairs(workspace:WaitForChild("DroppedItems"):GetDescendants()) do
    if v:FindFirstChildOfClass("ProximityPrompt") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
      local prox = v:FindFirstChildOfClass("ProximityPrompt")
      
      prox:InputHoldBegin()
      task.wait()
      prox:InputHoldEnd()
      task.wait()
    end
  end
end)
