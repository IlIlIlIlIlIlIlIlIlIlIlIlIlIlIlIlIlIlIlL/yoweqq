
local function find(table, value) -- table.find is not definied in bg editor as rb studio. i decided to make it yourself
    for _,v in next, table do
      if (v == value) then
        return v
      end
    end
end

getfenv().GlobalTable = {}
local mtGlobalTable = setmetatable(getfenv().GlobalTable, {
    __index = function(self, value)
        return find(self, value)
    end
})

getfenv().GetGlobalEnvironment = function()
  do return (getfenv().GlobalTable) or nil end
end
getgenv = getfenv().GetGlobalEnvironment


-- test example IS IT LUA!
getgenv().enabled = true
if (getgenv().enabled) then
  print('yoweqq is not newgen')
else
  print('yoweqq is newgen')
end
