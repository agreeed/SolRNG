game:GetService("RunService").Heartbeat:Connect(function()
  for i, v in pairs(workspace:WaitForChild("DroppedItems"):GetDescendants()) do
    if v:FindFirstChildOfClass("ProximityPrompt") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(math.random(-5, 5), 3, math.random(-5, 5)))
      local prox = v:FindFirstChildOfClass("ProximityPrompt")

      prox.RequiresLineOfSight = false
      prox.MaxActivationDistance = 10000
      prox:InputHoldBegin()
      task.wait()
      prox:InputHoldEnd()
      task.wait()
    end
  end
end)
