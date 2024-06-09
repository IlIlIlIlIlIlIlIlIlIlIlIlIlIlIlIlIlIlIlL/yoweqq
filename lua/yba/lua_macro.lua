local UIS = game:GetService("UserInputService")
m1Hit = {[1] = "Attack", [2] = "m1"}
local enabled = false

local M1Click = M1Click or function()
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(m1Hit))
end

UIS.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton3) then
        if (enabled == false) then
            enabled = true
        
            while (task.wait() and enabled) do
                if (enabled == false) then break; end
                coroutine.wrap(M1Click)();
            end
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton3) then
        enabled = false
    end
end)
