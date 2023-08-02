-- Compiled with roblox-ts v2.1.0
local ReloadebleLivingEntity
do
	ReloadebleLivingEntity = setmetatable({}, {
		__tostring = function()
			return "ReloadebleLivingEntity"
		end,
	})
	ReloadebleLivingEntity.__index = ReloadebleLivingEntity
	function ReloadebleLivingEntity.new(...)
		local self = setmetatable({}, ReloadebleLivingEntity)
		return self:constructor(...) or self
	end
	function ReloadebleLivingEntity:constructor()
	end
end
return {
	ReloadebleLivingEntity = ReloadebleLivingEntity,
}
