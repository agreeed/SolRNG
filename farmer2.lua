game:GetService("RunService").Heartbeat:Connect(function()
  for i, v in pairs(workspace:WaitForChild("DroppedItems"):GetDescendants()) do
    if v:FindFirstChildOfClass("ProximityPrompt") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      v.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
      v:FindFirstChildOfClass("ProximityPrompt"):InputHoldBegin()
      task.wait()
      v:FindFirstChildOfClass("ProximityPrompt"):InputHoldEnd()
      task.wait()
    end
  end
end)
