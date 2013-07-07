Object = class("Object", _G)

function Object:on(event, callback)
    self.handlers = self.handlers or {}
    self.handlers[event] = self.handlers[event] or {}
    table.insert(self.handlers[event], callback)
end

function Object:raise(event, ...)
    if not (self.handlers and self.handlers[event]) then return end
    for k, v in ipairs(self.handlers[event]) do
        v(...)
    end
end