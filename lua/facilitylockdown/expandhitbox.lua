-- // https://github.com/IlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlL
local LcPlayer = game.Players.LocalPlayer

getgenv().Library = {
    _enabled = true, -- toggle
    HEAD_NEW_VECTORSIZE = Vector3.new(4, 4 ,4), -- size
    HEAD_NEW_TRANSPARENCY = 0.5, -- transparency
    _hitbox = 'Head' -- hitbox
};

local function GetCharacters()
    local Characters = {}
    for _,v in game.Players:GetPlayers() do
        if (v.Character:FindFirstChild('Humanoid') and v.Character.Humanoid.Health ~= 0) then
            table.insert(Characters, v.Character)
        end
    end
    table.remove(Characters, table.find(Characters, LcPlayer.Character))
    return Characters
end

while (task.wait() and getgenv().Library._enabled) do
    if (getgenv().Library._enabled == false) then break; end

    for _,v in game.Players:GetPlayers() do
        if (table.find(GetCharacters(), v.Character)) then
            xpcall(function()
                v.Character:FindFirstChild(getgenv().Library._hitbox).Size = getgenv().Library.HEAD_NEW_VECTORSIZE

                v.Character:FindFirstChild(getgenv().Library._hitbox).Transparency = getgenv().Library.HEAD_NEW_TRANSPARENCY
                print(1)
            end, function()
                warn('[Error]: Something went wrong')
            end)
        end
    end
end
