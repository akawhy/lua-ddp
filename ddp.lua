local M = {}

local color = {
    r = "\27[1;31m",
    g = "\27[1;32m",
    y = "\27[1;33m",
    b = "\27[1;34m",
    p = "\27[1;35m"
}

-- type to color
local ttc = {
    ['nil']      = 'r',
    ['boolean']  = 'y',
    ['number']   = 'g',
    ['string']   = 'b',
    ['function'] = 'p'
}

local cn = "\27[0m"

--- print the indent
local function pi(indent)
    io.write(string.rep("   ", indent))
end

--- print next line
local function pl()
    io.write("\n")
end

--- print the variable
local function pv(var, c)
    if c and color[c] then
        io.write(color[c] .. tostring(var) .. cn)
    else
        io.write(tostring(var))
    end
end

--- print the table
local function pt(var, indent)
    pv('{'); pl()

    for k, v in pairs(var) do
        pi(indent + 1); pv('['); pv(k, ttc[type(k)]); pv(']  =>  ')

        local t = type(v)
        if t == 'table' then
            pt(v, indent + 1)
        else
            pv(v, ttc[t]); pl()
        end
    end

    pi(indent); pv('}'); pl()
end

function M.p(var) 
    local t = type(var)

    if t == 'table' then
        pt(var, 0)
    else
        pv(var, ttc[t]); pl()
    end
end

return M
