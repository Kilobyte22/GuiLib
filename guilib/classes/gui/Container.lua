load "gui/GuiElement.lua"

Container = class("Container", GuiElement)
function Container:__init()
    self:setSize(1, 1)
    self.childs = {}
end

function Container:render()
    for _, child in pairs(self.childs) do
        child:render()
    end
end

function Container:onClick(button, x, y)
    for _, c in ipairs(self.childs) do
        if c.x <= x and (c.width + c.x) > x and c.y <= y and c.heigth + c.y > y then
            c:onClick(button, x - c.x, y - c.y)
        end
    end
end

function Container:add(element)
    table.insert(self.childs, element)
    element:render()
end