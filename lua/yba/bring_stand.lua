getgenv().username = 'yoweqq' -- target player
getgenv().enabled = false -- toggle

local PlayersService = game:GetService('Players')
local LcPlayer = PlayersService.LocalPlayer


while (task.wait() and getgenv().enabled) do
    if (LcPlayer ~= nil and LcPlayer.Character ~= nil and PlayersService:FindFirstChild(getgenv().username)) then task.wait();
        local TARGET_PLAYER = PlayersService:FindFirstChild(getgenv().username) 

        if (TARGET_PLAYER.Character ~= nil and TARGET_PLAYER.Character:FindFirstChild('StandMorph')) then
            TARGET_PLAYER.Character['StandMorph']:FindFirstChild('HumanoidRootPart').CFrame = LcPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame
            *CFrame.new(0, 0,-3) -- change pos target`s stand
        else
            if not (TARGET_PLAYER.Character) then
                TARGET_PLAYER.CharacterAdded:Wait()
            end
        end
    else
        if not (LcPlayer) then
            PlayersService:GetPropertyChangedSignal('LocalPlayer'):Wait()
        end
    end
end
