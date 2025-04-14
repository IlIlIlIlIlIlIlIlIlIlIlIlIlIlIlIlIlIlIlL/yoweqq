local http_request = (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or request
local cloneref = cloneref or function(a: Instance) return a end

local WH_Address = getgenv().SSS_WEBHOOK
local Players = game:FindService([[Players]]) and cloneref(game:GetService([[Players]]))
local HttpService = cloneref(game:GetService([[HttpService]]))
local lcplayer = Players.LocalPlayer
task.wait(1)
print(string.rep(WH_Address, 25))
local function iscgang(name: string)
    if string.lower(name):match("[!@#$%%^&*()_+=%[%]{}|;:'\",.<>/?%s- ]") then
        return true
    end
    return false
end

local function send_webhook(webhook: string, plr: Player)
    local response = http_request({
        Url = webhook,
        Method = 'POST',
        Headers = {['Content-Type'] = 'application/json'},
        Body = HttpService:JSONEncode({
            content = string.format('емодзи генг: %s, хуесос: %s', plr.PlayerStats.Gang.Value, plr.Name),
            allowed_mentions = {parse = {}},
        })
    })
    return response
end

for _, v in Players:GetPlayers() do
    if v:FindFirstChild('PlayerStats') and v~=lcplayer then
        local gang_name = v.PlayerStats:FindFirstChild('Gang') and v.PlayerStats.Gang.Value
        if iscgang(gang_name) then
            local T=send_webhook(WH_Address, v)
        end;
    end;
end;

local TeleportService = cloneref(game:GetService([[TeleportService]]))
task.delay(0.5, function()
    queue_on_teleport(`
            getgenv().SSS_WEBHOOK = {WH_Address}
            loadstring(game:HttpGet('https://raw.githubusercontent.com/IlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIlL/yoweqq/refs/heads/main/lua/Roblox/YBA/cgangslogger.lua'))()`)
    local servers = {}
    local req = http_request({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
    local body = HttpService:JSONDecode(req.Body)
    
    if body and body.data then
        for i, v in next, body.data do
            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                table.insert(servers, 1, v.id)
            end
        end
    end
    
    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lcplayer)
    end
end)
