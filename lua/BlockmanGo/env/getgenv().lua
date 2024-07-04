_G.getgenv = {}
getgenv = setmetatable(_G.getgenv, {
    __call = function(self, ...)
        return self or nil
      end,
  
    __index = function(self, nObject)
        print("[Error]: env '".. nObject .."' is not declared!!!")
    end
})

--[[
print(getgenv().notdeclared) -- out nil and error
getgenv().yoweqqthebest = true
print(getgenv().yoweqqthebest) -- true
print(_G.getgenv.yoweqqthebest) -- true
]]
