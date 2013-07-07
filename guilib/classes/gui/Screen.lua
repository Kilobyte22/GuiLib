load "gui/Container.lua"

local Screen = class(Container)
function Screen:__new(term)
    self:setSize(term.getSize())
    self.term = term
end
_G.SCREEN = Screen(term)

on("mouse_click", function (e, button, x, y)
    SCREEN:onClick(button, x, y)
end)

function Screen:add(element)
    element.screen = self
    Container.add(self, element)
end

function Screen:render()
    for i = 1, self.heigth do
        self.term.setBackgroundColor(colors.black)
        self.term.setCursorPos(1, i)
        self.term.write((" "):rep(self.width))
    end
    Container.render(self)    
end