GuiElement = class("GuiElement")
function GuiElement:__init()
    self:setSize(1, 1)
    self:setLocation(1, 1)
end

function GuiElement:__new()
    
end

function GuiElement:render()
    
end

function GuiElement:setSize(width, heigth)
    self.width, self.heigth = width, heigth
end

function GuiElement:setLocation(x, y)
    self.x, self.y = x, y
end

function GuiElement:onClick(button, x, y)
    
end