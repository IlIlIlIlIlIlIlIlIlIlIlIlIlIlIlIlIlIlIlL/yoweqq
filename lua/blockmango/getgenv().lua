getfenv().GlobalTable = {}
local mtGlobalTable = setmetatable(getfenv().GlobalTable, {
    __index = function(self)
        return self
    end
})

getgenv = getfenv().GetGlobalEnvironment or getfenv().getgenv or function()
  do return (getfenv().GlobalTable) or nil end
end
