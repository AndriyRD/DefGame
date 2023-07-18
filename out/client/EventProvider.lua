-- Compiled with roblox-ts v2.1.0
local EventProvider
do
	EventProvider = setmetatable({}, {
		__tostring = function()
			return "EventProvider"
		end,
	})
	EventProvider.__index = EventProvider
	function EventProvider.new(...)
		local self = setmetatable({}, EventProvider)
		return self:constructor(...) or self
	end
	function EventProvider:constructor()
	end
	EventProvider.Runner = {
		Run = Instance.new("BindableEvent"),
		Stop = Instance.new("BindableEvent"),
	}
end
return {
	EventProvider = EventProvider,
}
