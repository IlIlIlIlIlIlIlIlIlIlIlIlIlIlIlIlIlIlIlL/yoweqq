-- execute script once and wait for hint on the screen

assert(isfile or writefile or readfile, "[+] Shit exploit lol")
print("[+] Gangs logger initilization")

local function blankfunc(...): any
    return ...
end
local cloneref : (obj : Instance) -> Instance = cloneref or blankfunc

local gethui = gethui or function()
    return cloneref(game:GetService([[CoreGui]]))
end;

local Players = cloneref(game:GetService([[Players]]))
local lcplayer = Players.LocalPlayer

local HttpService = game:GetService([[HttpService]])

if not isfile("gangslogger_writer.txt") then
    writefile("gangslogger_writer.txt", "")
end;

local WH_URL = readfile("gangslogger_writer.txt")
if not WH_URL or string.len(WH_URL) <= 2 then
    local info = Instance.new("Hint", gethui())
    info.Text = "[+] Failed to get webhook via ../workspace/gangslogger_writer.txt"
    game:GetService([[Debris]]):AddItem(info, 20)
    warn("[+] Failed to get webhook via ../workspace/gangslogger_writer.txt")
    return;
end;
local http_request = request or http_request or (syn and syn.request)

local SendMessage = function(webhook: string, message: string)
    local response = http_request({
        Url = webhook,
        Method = 'POST',
        Headers = {['Content-Type'] = 'application/json'},
        Body = HttpService:JSONEncode({
            content = message,
            allowed_mentions = {parse = {}},
        })
    })
    return response
end

coroutine.resume(coroutine.create(function()
    for _, v in Players:GetPlayers() do
        if v ~= lcplayer then
            local name = v:FindFirstChild("PlayerStats") and v.PlayerStats:FindFirstChild("Gang") and v.PlayerStats.Gang.Value
            if name:match("#") or name:match("%s") or (string.len(name) <= 2 and string.len(name) ~= 0) then
                task.spawn(SendMessage, WH_URL, ("> Gangs name: %s, Members name: %s"):format(name or "Gang-Less????", v.Name))
            end;
        end;
    end;
    do -- pasted from infinity yield
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
            pcall(function()
                game:GetService([[TeleportService]]):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lcplayer)
            end)
        end
    end
end))
print("[+] Execution success")
