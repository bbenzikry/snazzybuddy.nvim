local c = require('colorbuddy.color').colors
local s = require('colorbuddy.style').styles
local no = s.NONE
local M = {}

local icons = {

    ["gruntfile"] = {
        color = c.orange
    },
    ["gulpfile"] = {
        color = c.red
    },
    ["dropbox"] = {
        color = c.blue
    },
    ["xls"] = {
        color = c.green
    },
    ["doc"] = {
        color = c.blue
    },
    ["ppt"] = {
        color = c.red
    },
    ["xml"] = {
        color = c.orange
    },
    ["webpack"] = {
        color = c.cyan
    },
    ["settingsjson"] = {
        color = c.purple
    },
    ["cs"] = {
        color = c.blue
    },
    ["procfile"] = {

        color = c.purple

    },
    ["svg"] = {

        color = c.yellow

    },
    ["bashprofile"] = {

        color = c.green

    },
    ["bashrc"] = {

        color = c.green

    },
    ["babelrc"] = {

        color = c.yellow

    },
    ["ds_store"] = {

        color = c.gray

    },
    ["git"] = {
        color = c.red
    },
    ["gitattributes"] = {
        color = c.red
    },
    ["gitconfig"] = {
        color = c.red
    },
    ["gitignore"] = {
        color = c.red
    },
    ["GitCommit"] = {
        color = c.cyan
    },
    ["gitlabci"] = {

        color = c.red

    },
    ["gvimrc"] = {

        color = c.green

    },
    ["npmignore"] = {

        color = c.red

    },
    ["vimrc"] = {

        color = c.green

    },
    ["zshrc"] = {

        color = c.green

    },
    ["dockerfile"] = {

        color = c.blue

    },
    ["gemfile"] = {

        color = c.red

    },
    ["LICENSE"] = {
        color = c.orange
    },
    ["Vagrantfile"] = {
        color = c.blue
    },
    ["ai"] = {
        color = c.yellow
    },
    ["awk"] = {
        color = c.gray
    },
    ["bash"] = {
        color = c.green
    },
    ["bat"] = {
        color = c.yellow
    },
    ["bmp"] = {

        color = c.purple

    },
    ["c"] = {

        color = c.blue

    },
    ["CPlusPlus"] = {

        color = c.purple

    },
    ["clojure"] = {

        color = c.red

    },
    ["clojurec"] = {

        color = c.red

    },
    ["clojurejs"] = {

        color = c.red

    },
    ["cmakelists"] = {

        color = c.cyan

    },
    ["coffee"] = {

        color = c.yellow

    },
    ["conf"] = {

        color = c.gray

    },
    ["configru"] = {

        color = c.red

    },
    ["cp"] = {

        color = c.blue

    },
    ["cpp"] = {

        color = c.blue

    },
    ["csh"] = {

        color = c.gray

    },
    ["css"] = {

        color = c.blue

    },
    ["cxx"] = {

        color = c.blue

    },
    ["d"] = {

        color = c.green

    },
    ["dart"] = {

        color = c.blue

    },
    ["db"] = {

        color = c.gray

    },
    ["diff"] = {

        color = c.gray

    },
    ["dump"] = {

        color = c.gray

    },
    ["edn"] = {

        color = c.red

    },
    ["eex"] = {

        color = c.purple

    },
    ["ejs"] = {

        color = c.yellow

    },
    ["elm"] = {

        color = c.blue

    },
    ["erl"] = {

        color = c.purple

    },
    ["ex"] = {

        color = c.purple

    },
    ["exs"] = {

        color = c.purple

    },
    ["fsharp"] = {

        color = c.blue

    },
    ["favicon"] = {

        color = c.yellow

    },
    ["fish"] = {

        color = c.gray

    },
    ["fs"] = {

        color = c.blue

    },
    ["fsi"] = {

        color = c.blue

    },
    ["fsscript"] = {

        color = c.blue

    },
    ["fsx"] = {

        color = c.blue

    },
    ["gemspec"] = {

        color = c.red

    },
    ["gif"] = {

        color = c.purple

    },
    ["go"] = {

        color = c.blue

    },
    ["h"] = {

        color = c.purple

    },
    ["haml"] = {

        color = c.gray

    },
    ["hbs"] = {

        color = c.orange

    },
    ["hh"] = {

        color = c.purple

    },
    ["hpp"] = {

        color = c.purple

    },
    ["hrl"] = {

        color = c.purple

    },
    ["hs"] = {

        color = c.purple

    },
    ["htm"] = {

        color = c.red

    },
    ["html"] = {

        color = c.red

    },
    ["hxx"] = {

        color = c.purple

    },
    ["ico"] = {

        color = c.yellow

    },
    ["ini"] = {

        color = c.gray

    },
    ["java"] = {

        color = c.red

    },
    ["jl"] = {

        color = c.purple

    },
    ["jpeg"] = {

        color = c.purple

    },
    ["jpg"] = {

        color = c.purple

    },
    ["js"] = {

        color = c.yellow

    },
    ["json"] = {

        color = c.yellow

    },
    ["jsx"] = {

        color = c.yellow

    },
    ["ksh"] = {

        color = c.gray

    },
    ["leex"] = {

        color = c.purple

    },
    ["less"] = {

        color = c.purple

    },
    ["lhs"] = {

        color = c.purple

    },
    ["license"] = {

        color = c.yellow

    },
    ["lua"] = {

        color = c.blue

    },
    ["makefile"] = {

        color = c.gray

    },
    ["markdown"] = {

        color = c.blue

    },
    ["md"] = {

        color = c.blue

    },
    ["mdx"] = {

        color = c.blue

    },
    ["mixlock"] = {

        color = c.purple

    },
    ["mjs"] = {

        color = c.yellow

    },
    ["ml"] = {

        color = c.orange

    },
    ["mli"] = {

        color = c.orange

    },
    ["mustache"] = {

        color = c.orange

    },
    ["nix"] = {

        color = c.blue

    },
    ["nodemodules"] = {

        color = c.red

    },
    ["php"] = {

        color = c.purple

    },
    ["pl"] = {

        color = c.cyan

    },
    ["pm"] = {

        color = c.cyan

    },
    ["png"] = {

        color = c.purple

    },
    ["pp"] = {

        color = c.blue

    },
    ["promptps1"] = {

        color = c.blue

    },
    ["psb"] = {

        color = c.cyan

    },
    ["psd"] = {

        color = c.cyan

    },
    ["py"] = {

        color = c.blue

    },
    ["pyc"] = {

        color = c.gray

    },
    ["pyd"] = {

        color = c.gray

    },
    ["pyo"] = {

        color = c.gray

    },
    ["r"] = {

        color = c.green

    },
    ["R"] = {

        color = c.green

    },
    ["rake"] = {

        color = c.red

    },
    ["rakefile"] = {

        color = c.red

    },
    ["rb"] = {

        color = c.red

    },
    ["rlib"] = {

        color = c.orange

    },
    ["rmd"] = {

        color = c.blue

    },
    ["Rmd"] = {

        color = c.blue

    },
    ["rproj"] = {

        color = c.green

    },
    ["rs"] = {

        color = c.orange

    },
    ["rss"] = {

        color = c.orange

    },
    ["sass"] = {

        color = c.pink

    },
    ["scala"] = {

        color = c.red

    },
    ["scss"] = {

        color = c.pink

    },
    ["sh"] = {

        color = c.gray

    },
    ["slim"] = {

        color = c.red

    },
    ["sln"] = {

        color = c.purple

    },
    ["sql"] = {

        color = c.gray

    },
    ["styl"] = {

        color = c.green

    },
    ["suo"] = {

        color = c.purple

    },
    ["swift"] = {

        color = c.orange

    },
    ["t"] = {

        color = c.cyan

    },
    ["tex"] = {

        color = c.green

    },
    ["toml"] = {

        color = c.cyan

    },
    ["ts"] = {

        color = c.blue

    },
    ["tsx"] = {

        color = c.blue

    },
    ["twig"] = {

        color = c.green

    },
    ["vim"] = {

        color = c.green

    },
    ["vue"] = {

        color = c.green

    },
    ["webmanifest"] = {

        color = c.yellow

    },
    ["webp"] = {

        color = c.purple

    },
    ["xcplayground"] = {

        color = c.orange

    },
    ["xul"] = {

        color = c.orange

    },
    ["yaml"] = {

        color = c.cyan

    },
    ["yml"] = {

        color = c.cyan

    },
    ["zsh"] = {

        color = c.green

    },
    ["terminal"] = {

        color = c.green

    },
    ["pdf"] = {

        color = c.red

    },
    ["kt"] = {

        color = c.orange

    },
    ["mp3"] = {

        color = c.gray

    },
    ["mp4"] = {

        color = c.gray

    },
    ["out"] = {

        color = c.gray

    },
    ["lock"] = {
        color = c.pink
    },
    ["zip"] = {
        color = c.yellowfaded
    },
    ["xz"] = {
        color = c.yellowfaded
    }
}

function M.setup(Group)
    for name, icon in pairs(icons) do
        local color = icon.color
        local background = icon.background and icon.background or c.none
        local computed_name = 'DevIcon' .. name
        -- print(computed_name)
        Group.new(computed_name, color, background, no)
    end
end

return M

