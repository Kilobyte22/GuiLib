local gm, sm = getmetatable, setmetatable
local function classindex(obj, index)
    return gm(obj).class[index]
end

local function constructor(class, ...)
    local obj = {}
    sm(obj, {class = class, __index = classindex})
    for k, v in ipairs(class.superStack) do
        --print("Calling init for "..(class.name or "Unknown"))
        if v.__init then v.__init(obj) end
    end
    if class.__new then class.__new(obj, ...) end
    return obj

end

function _G.class(name, super)
    if type(name) ~= "string" then super = name name = nil end
    local class = {name = name, super = super}
    local c = class
    local c_ = {}
    while c and c ~= _G do
        --print("Super found for "..(name or "Unknown")..": "..(c.name or "Unknown"))
        table.insert(c_, 1, c)
        c = c.super
    end
    class.superStack = c_
    return sm(class, {__call = constructor, super = super, __index = super or Object})
end

load "Object.lua"