-- Compiled with roblox-ts v2.1.0
local FactoryMap
do
	FactoryMap = setmetatable({}, {
		__tostring = function()
			return "FactoryMap"
		end,
	})
	FactoryMap.__index = FactoryMap
	function FactoryMap.new(...)
		local self = setmetatable({}, FactoryMap)
		return self:constructor(...) or self
	end
	function FactoryMap:constructor()
		self.map = {}
	end
	function FactoryMap:Set(key, item)
		local _map = self.map
		local _key = key
		local _item = item
		_map[_key] = _item
		return self
	end
	function FactoryMap:GetMap()
		return self.map
	end
	function FactoryMap:Find(key)
		local _map = self.map
		local _key = key
		return _map[_key]
	end
end
return {
	FactoryMap = FactoryMap,
}
