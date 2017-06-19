--[[
    
    Simple Script - Color Checking
    Code Request: https://www.reddit.com/r/autotouch/comments/6hv6w6/request_make_me_a_simple_script_for_15/
    AutoTouch 3.6.1
    https://github.com/kaijxc/AutoTouch-Scripts

]]

-- This is your color class, don't touch this.

local Color = {}
function Color.new(table, region)
    local o = {}
    o.table = table
    o.region = region
    return o
end

-- This is where you will add your colors, get this from the AutoTouch helper function, you can replace nil
-- with whatever region you need. 

local Pixels = {
    white   = Color.new({{16763733,0,0}, {16771668,0,86}, {16771669,86,86}, {16763734,86,0}}, nil),
    blue    = Color.new({{16764763,0,0}, {16766040,0,86}, {38542343,86,86}, {16762428,86,0}}, nil),
    red     = Color.new({{11391980,0,0}, {13625850,0,86}, {13757436,86,86}, {11391981,86,0}}, nil)
}

-- This function will check for the colors on the screen, it's set to match all points. Change the count
-- parameter if you want less accuracy.

function hasColor(color)
    local t = findColors(color.table, 0, color.region)

    -- if color is found then return true
    if next(t) ~= nil then
        log(string.format("1. Found %s instances of color %s", #t, color.table[1][1]))
        return true
    else
        log(string.format("1. Did not find %s", color.table[1][1]))
    end
end

-- This function will check for the color on the screen, like before it will scan the entire screen. 
-- Additionally, this function will tap every pixel where the color is found.

function tapColor(color)
    local t = findColors(color.table, 0, color.region)

    -- if color is found then tap each instance of it
    if next(t) ~= nil then
        log(string.format("2. Found %s instances of color %s", #t, color.table[1][1]))
        for k, v in pairs(t) do
            tap(v[1], v[2])
            log(string.format("3. Tapped: %f, %f", v[1], v[2]))
        end
    else
        log(string.format("2. Did not find %s", color.table[1][1]))
    end
end

-- This is your logic function, it executes exactly how it reads, for example:
-- colorBranch(color1, color2) 
-- If the screen has color1, then tap color2. 

function colorBranch(color1, color2)
    if hasColor(color1) then
        tapColor(color2)
    end
end

-- Anything below here feel free to edit, change for the colors. 

colorBranch(Pixels.white, Pixels.red)