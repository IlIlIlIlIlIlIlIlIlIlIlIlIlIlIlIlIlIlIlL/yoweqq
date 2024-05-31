local UIS = game:GetService("UserInputService")
m1Hit = {[1] = "Attack", [2] = "m1"}
local enabled = false

UIS.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton3) then
        if (enabled == false) then
            enabled = true
        
            while task.wait() do
                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(m1Hit))
                if (enabled == false) then break; end
                task.wait()
            end
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton3) then
        enabled = false
    end
end)
