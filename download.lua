
local os = require("os")
local lfs = require("lfs")

local function git_add_module(name)
  os.execute("git submodule add --force " .. name)
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


syntax_down = {
}

lfs.chdir("syntax")
for _,name in ipairs(syntax_down) do
  download_file(name)
end

lfs.chdir("../")


bundles_git = {
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tomtom/tcomment_vim.git",
  "https://github.com/tomasr/molokai.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/Valloric/YouCompleteMe.git",
  "https://github.com/scrooloose/syntastic.git",
  "https://github.com/bling/vim-airline",
  "https://github.com/mileszs/ack.vim.git",
  "https://github.com/sjl/gundo.vim.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/dag/vim2hs.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/scrooloose/nerdcommenter.git",
  "https://github.com/kien/ctrlp.vim.git"
}

lfs.chdir("bundle")
for _,name in ipairs(bundles_git) do
  git_add_module(name)
end

os.execute("git add -A; git commit -m 'Built'")
os.execute("git submodule update --init --recursive")

lfs.chdir("YouCompleteMe")
--The --system-libclang option is highly not recommended, but works...
os.execute("export CXX=g++; ./install.sh --clang-completer --system-libclang")
lfs.chdir("../")

lfs.chdir("../")

print("\nTo rebuild, git checkout master and re-run the install script")
