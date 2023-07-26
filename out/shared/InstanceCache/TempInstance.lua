-- Compiled with roblox-ts v2.1.0
local TempInstance
do
	TempInstance = setmetatable({}, {
		__tostring = function()
			return "TempInstance"
		end,
	})
	TempInstance.__index = TempInstance
	function TempInstance.new(...)
		local self = setmetatable({}, TempInstance)
		return self:constructor(...) or self
	end
	function TempInstance:constructor(instance, maxLifeTime)
		self.instance = instance
		self.maxLifeTime = maxLifeTime
		self.lifeTime = 0
	end
	function TempInstance:Update(update)
		self.lifeTime = update(self.lifeTime)
		return self
	end
	function TempInstance:ResetLifeTime()
		self.lifeTime = 0
		return self
	end
	function TempInstance:IsOld()
		return self.lifeTime >= self.maxLifeTime
	end
	function TempInstance:GetInstance()
		return self.instance
	end
	function TempInstance:GetLifeTime()
		return self.lifeTime
	end
end
return {
	TempInstance = TempInstance,
}
