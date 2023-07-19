-- Compiled with roblox-ts v2.1.0
local BaseFireHandler
do
	BaseFireHandler = setmetatable({}, {
		__tostring = function()
			return "BaseFireHandler"
		end,
	})
	BaseFireHandler.__index = BaseFireHandler
	function BaseFireHandler.new(...)
		local self = setmetatable({}, BaseFireHandler)
		return self:constructor(...) or self
	end
	function BaseFireHandler:constructor(weapon)
		self.weapon = weapon
	end
	function BaseFireHandler:Fire()
		return self
	end
end
return {
	BaseFireHandler = BaseFireHandler,
}
