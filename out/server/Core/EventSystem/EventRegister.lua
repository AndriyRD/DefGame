-- Compiled with roblox-ts v2.1.0
local EventRegister
do
	EventRegister = setmetatable({}, {
		__tostring = function()
			return "EventRegister"
		end,
	})
	EventRegister.__index = EventRegister
	function EventRegister.new(...)
		local self = setmetatable({}, EventRegister)
		return self:constructor(...) or self
	end
	function EventRegister:constructor()
		self.listeners = {}
	end
	function EventRegister:Register(listener)
		local _eventHandler = listener.EventHandler
		local _arg0 = function(handler, key)
			local eventInst = listener:GetEventDirecotry():FindFirstChild(key)
			if eventInst then
				eventInst.OnServerEvent:Connect(handler)
				print("Add new event handler: " .. key)
			else
				warn("Not found event for listener: " .. (listener:GetId() .. (" (event: " .. (key .. ")"))))
			end
		end
		for _k, _v in _eventHandler do
			_arg0(_v, _k, _eventHandler)
		end
		local _listeners = self.listeners
		local _listener = listener
		table.insert(_listeners, _listener)
		print("Registered new event-listener " .. listener:GetId())
		return self
	end
end
return {
	EventRegister = EventRegister,
}
