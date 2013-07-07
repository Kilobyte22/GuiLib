load "gui/GuiElement.lua"

Button = class(GuiElement)
function Button:__new(text)
    self.currentbg = colors.blue
    self.currentfg = colors.white
    self.back = colors.blue
    self.fore = colors.white
    self.clickback = colors.lime
    self.clickfore = colors.white
    self.disableback = colors.gray
    self.disablefore = colors.white
    self.enabled = true
    self.caption = text or ""
end

function Button:onClick(button, x, y)
    if button ~= 1 then return end
    if not self.enabled then return end
    if self.mode == "toggle" then
        self.active = not self.active
        self:render()
        self:raise("toggle")
    elseif self.mode == "trigger" then
        self.active = true
        self:render()
        self:raise("trigger")
    else
        self.active = true
        self:render()
        local tmr = os.clock()
        self:raise("click")
        tmr = os.clock() - tmr
        if tmr < 0.2 then
            sleep(0.2 - tmr)
        end
        self.active = false
        self:render()
    end
end

function Button:render()
    if not self.enabled then
        self.currentbg = self.disableback
        self.currentfg = self.disablefore
    elseif self.active then
        self.currentbg = self.clickback
        self.currentfg = self.clickfore
    else
        self.currentbg = self.back
        self.currentfg = self.fore
    end
    local term = self.screen.term
    term.setBackgroundColor(self.currentbg)
    for i = self.y, self.y + self.heigth - 1 do
        term.setCursorPos(self.x, i)
        term.write((" "):rep(self.width))
    end

    local y = math.floor(self.heigth / 2) + self.y
    local x = math.floor((self.width - #self.caption) / 2) + self.x

    self.screen.term.setCursorPos(x, y)
    self.screen.term.write(self.caption)
end

function Button:setLocation(x, y)
    GuiElement.setLocation(self, x, y)
    if self.screen then self.screen:render() end
end