-- Compiled with roblox-ts v2.1.0
local PlayerFireModules
do
	PlayerFireModules = setmetatable({}, {
		__tostring = function()
			return "PlayerFireModules"
		end,
	})
	PlayerFireModules.__index = PlayerFireModules
	function PlayerFireModules.new(...)
		local self = setmetatable({}, PlayerFireModules)
		return self:constructor(...) or self
	end
	function PlayerFireModules:constructor()
		self.list = {}
	end
	function PlayerFireModules:GetOrCreateModules(plr)
		local _list = self.list
		local _plr = plr
		local modules = _list[_plr]
		if not modules then
			local _list_1 = self.list
			local _plr_1 = plr
			_list_1[_plr_1] = {}
			local _list_2 = self.list
			local _plr_2 = plr
			return _list_2[_plr_2]
		end
		return modules
	end
	function PlayerFireModules:GetFireModule(plr, id)
		local modules = self:GetOrCreateModules(plr)
		for _, item in modules do
			if item.ID == id then
				return item
			end
		end
		error("Not found weapon fire-module for: " .. id)
	end
	function PlayerFireModules:Add(plr, id, fireModule)
		local _exp = self:GetOrCreateModules(plr)
		local _arg0 = {
			ID = id,
			FireModule = fireModule,
		}
		table.insert(_exp, _arg0)
	end
end
return {
	PlayerFireModules = PlayerFireModules,
}
