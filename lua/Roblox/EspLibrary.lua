--[[
    это огрызок говна не используйте
    24.06.2024 | 21:18 GPT+3
]]


local LcPlayer = game:FindService('Players').LocalPlayer

local EspLibrary = {
    Players = {},
    TracersCollection = {},
    BoxesCollection = {},
    EspsCollection = {},

    Settings = {
        _enabled = true,
        TeamCheck = true,

        TracersColor = Color3.fromRGB(255, 255, 1),
        TracersThickness = 1,
        TracersFrom = Vector2.new(LcPlayer:GetMouse().X, LcPlayer:GetMouse().Y +36),
    }
}

EspLibrary.CALL_InsertPlayers = function()
    for index, player in next, game:FindService('Players'):GetPlayers() do
        if (table.find(EspLibrary.Players, player) and player ~= nil) then
            do table.remove(EspLibrary.Players, player) end
            return;
        end
        
        do table.insert(EspLibrary.Players, player) end

        if (table.find(EspLibrary.Players, LcPlayer) and EspLibrary.Settings.TeamCheck) then
            do table.remove(EspLibrary.Players, table.find(EspLibrary.Players, LcPlayer)) end
        end
    end
end

EspLibrary._new = function(dType, properties) -- improved Drawing.new | own version
    local newdrawing;
    pcall(function() newdrawing = Drawing.new(dType) end)
    for index, value in next, properties do
        newdrawing[index] = value
    end
    return newdrawing
end

EspLibrary.DrawEsp = function(Object)
    local Drawings = {
        TracerLine = EspLibrary._new('Line', {Thickness = 1})
    }
    EspLibrary.EspsCollection[Object] = Drawings
end

EspLibrary.CALL_InsertPlayers() -- 
for _,v in next, EspLibrary.Players do
    if (v.Character == nil or not v.Character:FindFirstChild('HumanoidRootPart')) then return; end
    EspLibrary.DrawEsp(v.Character:FindFirstChild('HumanoidRootPart'))
end

game:GetService('Players').PlayerAdded:Connect(function(PlayerAdded) -- on player added ingame
    EspLibrary.CALL_InsertPlayers()
end)

game:GetService('Players').PlayerRemoving:Connect(function(PlayerAdded) -- on player removed ingame
    EspLibrary.CALL_InsertPlayers()
end)


return EspLibrary
