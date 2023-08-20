-- Compiled with roblox-ts v2.1.0
local BaseHitHandler
do
	BaseHitHandler = setmetatable({}, {
		__tostring = function()
			return "BaseHitHandler"
		end,
	})
	BaseHitHandler.__index = BaseHitHandler
	function BaseHitHandler.new(...)
		local self = setmetatable({}, BaseHitHandler)
		return self:constructor(...) or self
	end
	function BaseHitHandler:constructor()
	end
	function BaseHitHandler:OnHit(res)
	end
	function BaseHitHandler:OnHitPart(res)
	end
	function BaseHitHandler:OnHitEnity(entity, res)
	end
end
return {
	BaseHitHandler = BaseHitHandler,
}
