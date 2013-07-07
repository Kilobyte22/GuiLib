load "gui/GuiElement.lua"

Progressbar = class("Progressbar", GuiElement)
function Progressbar:__new(text) 
    self.text = text or ""
    self.width = 10
    self.active = false
    self.enabled = true
    self.back = colors.black
    self.fore = colors.lime
    self.progress = 0
end

function Progressbar:render()
    local w = math.floor(self.width * (self.progress / 100))

    local term = self.screen.term
    term.setBackgroundColor(self.fore)
    for i = self.y, self.y + self.heigth - 1 do
        term.setCursorPos(self.x, i)
        term.write((" "):rep(w))
    end

    term.setBackgroundColor(self.back)
    for i = self.y, self.y + self.heigth - 1 do
        term.setCursorPos(self.x + w + 1, i)
        term.write((" "):rep(self.width - w))
    end

    local y = math.floor(self.heigth / 2) + self.y
    local x = math.floor((self.width - #self.text) / 2) + self.x

    self.screen.term.setCursorPos(x, y)
    self.screen.term.write(self.text)
end

function Progressbar:setProgress(value)
    self.progress = value
    if self.screen then self:render() end
end