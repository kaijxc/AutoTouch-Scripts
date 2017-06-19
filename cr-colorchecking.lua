--[[
    
    Simple Script - Color Checking
    Code Request: https://www.reddit.com/r/autotouch/comments/6hv6w6/request_make_me_a_simple_script_for_15/
    AutoTouch 3.6.1
    https://github.com/kaijxc/AutoTouch-Scripts

]]

-- This is the color table, you're going to populate this table with all the colors you need.
-- Make sure there is a comma at the end of each line except for the last, otherwise AutoTouch
-- will throw an error at you when you try and run this script. The colors need to be in
-- interger format. You can use the AutoTouch helper to find the colors.

local Color = {
    white   = 16777215,
    red     = 16711680,
    green   = 65280,
    blue    = 255
}

-- This function will check for the color on the screen, keep in mind this will scan the entire
-- screen as 'region' is nil. If this function finds the color, it will return true.

function hasColor(color)
    local t = findColor(color, 0, nil)

    -- if color is found then return true
    if next(t) ~= nil then
        log(string.format("1. Found %s instances of color %s", #t, color))
        return true
    else
        log(string.format("1. Did not find %s", color))
    end
end

-- This function will check for the color on the screen, like before it will scan the entire screen. 
-- Additionally, this function will tap every pixel where the color is found.

function tapColor(color)
    local t = findColor(color, 0, nil)

    -- if color is found then tap each instance of it
    if next(t) ~= nil then
        log(string.format("2. Found %s instances of color %s", #t, color))
        for k, v in pairs(t) do
            tap(v[1], v[2])
            log(string.format("3. Tapped: %f, %f", v[1], v[2]))
        end
    else
        log(string.format("2. Did not find %s", color))
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

colorBranch(Color.white, Color.red)
colorBranch(Color.green, Color.blue)