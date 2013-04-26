
local os = require("os")
local lfs = require("lfs")

local function git_clone(name)
  os.execute("git clone " .. name)
end

local function download_file(name)
  os.execute("wget " .. name)
end

--install pathogen
pathogen_file = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

lfs.chdir("autoload")
download_file(pathogen_file)
lfs.chdir("../")

bundles_git = {
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tomtom/tcomment_vim.git",
  "https://github.com/tomasr/molokai.git",
  "https://github.com/tpope/vim-fugitive.git"
}

lfs.chdir("bundle")
for _,name in ipairs(bundles_git) do
  git_clone(name) 
end
lfs.chdir("../")

