getfenv()._glEnvT = {}
local mtGlobalTable = setmetatable(getfenv()._glEnvT, {
    __index = function(self, table)
        return string.format("[Error]: env variable/table '"..table.. "' is not declared")
    end
})

getgenv = getfenv().GetGlobalEnvironment or getfenv().getgenv or function()
  do return (getfenv()._glEnvT) or nil end
end

--[[ test stuff (you can delete it)
getgenv().list = { -- getgenv() table
  enabled = true,
  author = "yoweqq",
  value = 1
}

for _,v in next, getgenv().list do
  print(_, v)
end

getgenv().AAA = 32
print(getgenv().AAA, "1 test")
getfenv()._glEnvT.AAA = 50
print(getgenv().AAA, "2 test")

print(getfenv()[0]) -- nil
print(getgenv()[0]) -- error env variable/table
]]

