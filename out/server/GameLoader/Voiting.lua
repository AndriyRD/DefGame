-- Compiled with roblox-ts v2.1.0
local Voiting
do
	Voiting = setmetatable({}, {
		__tostring = function()
			return "Voiting"
		end,
	})
	Voiting.__index = Voiting
	function Voiting.new(...)
		local self = setmetatable({}, Voiting)
		return self:constructor(...) or self
	end
	function Voiting:constructor(mapList)
		self.mapList = mapList
		self.data = {}
		for _, item in mapList do
			self.data[item] = {}
		end
	end
	function Voiting:Vote(plr, mapName)
		local _data = self.data
		local _mapName = mapName
		local _exp = _data[_mapName]
		local _plr = plr
		table.insert(_exp, _plr)
	end
	function Voiting:GetFavorite()
		local res = self.mapList[1]
		for _k, _v in self.data do
			local item = { _k, _v }
			if #item[2] > #res then
				res = item[1]
			end
		end
		return res
	end
end
return {
	Voiting = Voiting,
}
