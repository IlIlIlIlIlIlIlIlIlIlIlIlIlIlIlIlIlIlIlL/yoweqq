local function blankfunction(...) : any
    return ...
end

local cloneref : (obj : Instance) -> Instance = cloneref or blackfunction
local CPlayers : Players = cloneref(game:GetService('Players'))
local LcPlayer : LocalPlayer = cloneref(CPlayers.LocalPlayer)

getgenv().enabled = true



while (task.wait() and getgenv().enabled) do
    if not (LcPlayer.Character.SpawnProtection.Disabled) then
        LcPlayer.Character.SpawnProtection.Disabled = true
    end

    for index, v in next, CPlayers:GetPlayers() do
        if (v ~= LcPlayer and v.Team ~= LcPlayer.Team and v.Character ~= nil and v.Character:FindFirstChild('HumanoidRootPart') ~= nil
            and v.Team ~= game.Teams.Neutral and v.Character:FindFirstChild('Humanoid') and v.Character.Humanoid.Health ~= 0) then

            spawn(function()
                repeat
                    v.Character.HumanoidRootPart.Size = Vector3.new(11, 11, 11)
                    if (v == CPlayers:GetChildren()[index]) then
                        LcPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame = v.Character.HumanoidRootPart.CFrame *CFrame.new(0, -1, 3)
                    else
                        task.wait()
                    end
                until LcPlayer.Character == nil or v:FindFirstChild('Humanoid') == nil or v.Humanoid.Health:GetPropertyChangedSignal('Health') == 0
            end)
        else
            task.wait()
        end
    end
end
