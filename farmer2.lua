local tws = game:GetService("TweenService")
local vhrp = Instance.new("Part")
vhrp.Anchored = true
      
game:GetService("RunService").Heartbeat:Connect(function()
  for i, v in pairs(workspace:WaitForChild("DroppedItems"):GetDescendants()) do
    if v:FindFirstChildOfClass("ProximityPrompt") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
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
