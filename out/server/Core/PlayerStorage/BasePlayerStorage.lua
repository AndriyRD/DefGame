-- Compiled with roblox-ts v2.1.0
local BasePlayerStorage
do
	BasePlayerStorage = setmetatable({}, {
		__tostring = function()
			return "BasePlayerStorage"
		end,
	})
	BasePlayerStorage.__index = BasePlayerStorage
	function BasePlayerStorage.new(...)
		local self = setmetatable({}, BasePlayerStorage)
		return self:constructor(...) or self
	end
	function BasePlayerStorage:constructor(player)
		self.player = player
		self.items = {}
	end
	function BasePlayerStorage:AddItem(key, item)
		local _items = self.items
		local _key = key
		if _items[_key] ~= nil then
			return {
				Saccess = false,
				Storage = self,
			}
		end
		local _items_1 = self.items
		local _key_1 = key
		local _item = item
		_items_1[_key_1] = _item
		return {
			Saccess = true,
			Storage = self,
		}
	end
	function BasePlayerStorage:RemoveItem(key)
		local _items = self.items
		local _key = key
		if not (_items[_key] ~= nil) then
			return {
				Saccess = false,
				Storage = self,
			}
		end
		local _fn = table
		local _items_1 = self.items
		local _key_1 = key
		_fn.clear(_items_1[_key_1])
		return {
			Saccess = true,
			Storage = self,
		}
	end
	function BasePlayerStorage:GetItem(key)
		local _items = self.items
		local _key = key
		return _items[_key]
	end
	function BasePlayerStorage:Unload()
		return warn("Ovveride")
	end
end
return {
	BasePlayerStorage = BasePlayerStorage,
}
