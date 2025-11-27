local osys = require("cmake-tools.osys")
return {
  "cmake-tools.nvim",
  enabled = true,
  opts = {
    cmake_build_directory = function()
      if osys.iswin32 then
        return "build\\${variant:buildType}"
      end
      return "build/${variant:buildType}"
    end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
  },
}
