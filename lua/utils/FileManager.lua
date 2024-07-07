--B3$7LU4C0D3R1N7H3W0R1D

local open = io.open
_G.FILEMANAGER = {
  FileExist = function(self, path)
      return io.open(path, "r") ~= nil
  end,
  
  WriteFile = function(self, path, content)
      return io.open(path, "w"):write(content), io.open(path, "w"):close()
  end,
  
  DestroyFile = function(self, path)
      pcall(os.remove(path))
  end,
  
  OutMethods = function(self, func)
      for index, method in next, self do
          func(index, method)
      end
  end
}

local FileManager = setmetatable(_G.FILEMANAGER, {
    __call = function(self, p)
        return self:OutMethods(p)
    end,
    __index = self
}) or getmetatable(_G.FILEMANAGER)

--[[examples, by yoweqq]]
local fileRep = "/storage/emulated/0/"
print(FileManager:FileExist(fileRep.. "test.lua")) -- check for file

FileManager:DestroyFile(fileRep.. "test.lua")
FileManager:WriteFile(fileRep.. "test.lua", '[[m7md is newgen and free]]')
print(FileManager:FileExist(fileRep.. "test.lua"))
FileManager(_G.print)
