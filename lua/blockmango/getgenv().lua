getfenv()._glEnvT = {}
local mtGlobalTable = setmetatable(getfenv()._glEnvT, {
    __index = function(self)
        return type(self)
    end
})

getgenv = getfenv().GetGlobalEnvironment or getfenv().getgenv or function()
  do return (getfenv()._glEnvT) or nil end
end

