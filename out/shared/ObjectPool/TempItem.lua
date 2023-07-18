-- Compiled with roblox-ts v2.1.0
local TempItem
do
	TempItem = setmetatable({}, {
		__tostring = function()
			return "TempItem"
		end,
	})
	TempItem.__index = TempItem
	function TempItem.new(...)
		local self = setmetatable({}, TempItem)
		return self:constructor(...) or self
	end
	function TempItem:constructor(item, maxLifeTime)
		self.item = item
		self.maxLifeTime = maxLifeTime
		self.lifeTime = 0
		self.OnUpdate = Instance.new("BindableEvent")
	end
	function TempItem:Update(updateLigeTime)
		self.lifeTime = updateLigeTime(self.lifeTime)
		self.OnUpdate:Fire(self.lifeTime)
	end
	function TempItem:IsOld()
		return self.lifeTime >= self.maxLifeTime
	end
	function TempItem:GetItem()
		return self.item
	end
	function TempItem:GetLifeTime()
		return self.lifeTime
	end
	function TempItem:Dispose()
		local _item = self.item
		if typeof(_item) == "Instance" then
			(self.item):Destroy()
		else
			local _item_1 = self.item
			if typeof(_item_1) == "table" then
				table.clear(self.item)
			end
		end
		self.item = nil
		self.lifeTime = nil
		self.maxLifeTime = nil
		self.OnUpdate = nil
	end
end
return {
	TempItem = TempItem,
}
