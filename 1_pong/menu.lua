local menu = {}

--[[
menu
    * 1 player
    * 2 player
        > easy
        > normal
        > hard
    * quit
]]-- 

buttons = {"1p", "2p", "quit"}
difficulties = {"easy", "normal", "hard"}
selected = buttons[1]

function menu.load()
    print("\nmenu loaded")
end

function menu.update()
end

function menu.draw()
end

return menu