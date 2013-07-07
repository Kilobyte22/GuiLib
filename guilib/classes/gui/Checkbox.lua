load "gui/GuiElement.lua"

Checkbox = class("Checkbox", GuiElement)
function Checkbox:__new(text) 
    self.text = text or ""
    self.width = #(self.text) + 4
    self.active = false
    self.enabled = true
    self.back = colors.black
    self.fore = colors.white
end

function Checkbox:render()
    self.screen.term.setCursorPos(self.x, self.y)
    self.screen.term.setTextColor(self.fore)
    self.screen.term.setBackgroundColor(self.back)
    self.screen.term.write("["..(self.active and "X" or " ").."] "..self.text)
end

function Checkbox:onClick(button)
    if button ~= 1 or not self.enabled then return end
    self.active = not self.active
    self:render()
    self:raise("toggle")
end