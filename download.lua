
local os = require("os")
local lfs = require("lfs")

local function git_clone(name)
  os.execute("git clone " .. name)
end

local function download_file(name)
  os.execute("wget " .. name)
end

os.execute("git branch -D build; git checkout -b build")

--install pathogen
pathogen_file = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

lfs.chdir("autoload")
download_file(pathogen_file)
lfs.chdir("../")

bundles_git = {
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tomtom/tcomment_vim.git",
  "https://github.com/tomasr/molokai.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/Valloric/YouCompleteMe.git",
  "https://github.com/scrooloose/syntastic.git",
  "https://github.com/bling/vim-airline"
}

lfs.chdir("bundle")
for _,name in ipairs(bundles_git) do
  git_clone(name)
end

lfs.chdir("YouCompleteMe")
os.execute("export CXX=g++; ./install.sh --clang-completer")
lfs.chdir("../")

lfs.chdir("../")

syntax_down = {
  "https://raw.github.com/vim-scripts/cg.vim/master/syntax/cg.vim"
}


lfs.chdir("syntax")
for _,name in ipairs(syntax_down) do
  download_file(name) 
end

os.execute("dos2unix cg.vim")

lfs.chdir("../")

os.execute("git add -A; git commit -m 'Built'")
print("\nTo rebuild, git checkout master and re-run the install script")
