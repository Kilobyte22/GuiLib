load "gui/GuiElement.lua"

Label = class("Label", GuiElement)
function Label:__new(text, x, y)
    self:setLocation(x, y)
    self:setSize(#text, 1)
    self.text = text
    self.back = colors.black
    self.fore = colors.white
end

function Label:render()
    self.screen.term.setCursorPos(self.x, self.y)
    self.screen.term.setTextColor(self.fore)
    self.screen.term.setBackgroundColor(self.back)
    self.screen.term.write(self.text)
end