-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local BaseWrappedEquipment = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Wrappers", "BaseWrappedEquipment").BaseWrappedEquipment
local EquipmentWrappManager
do
	EquipmentWrappManager = setmetatable({}, {
		__tostring = function()
			return "EquipmentWrappManager"
		end,
	})
	EquipmentWrappManager.__index = EquipmentWrappManager
	function EquipmentWrappManager.new(...)
		local self = setmetatable({}, EquipmentWrappManager)
		return self:constructor(...) or self
	end
	function EquipmentWrappManager:constructor()
		self.factoryList = {}
	end
	function EquipmentWrappManager:Wrap(equipment)
		local equipmentType = equipment:GetEquipmentType()
		if equipmentType == EQUIPMENT_TYPES.DEFAULT then
			return BaseWrappedEquipment.new(equipment)
		end
		for _k, _v in self.factoryList do
			local item = { _k, _v }
			local _type = item[1]
			local factory = item[2]
			if _type == equipment:GetEquipmentType() then
				return factory(equipment)
			end
		end
		error("Not found equipment-wrapper of type: " .. equipment:GetEquipmentType())
	end
	function EquipmentWrappManager:AddFactory(_type, factory)
		local _exp = self:GetFactories()
		local __type = _type
		local _factory = factory
		_exp[__type] = _factory
		return self
	end
	function EquipmentWrappManager:GetFactories()
		return self.factoryList
	end
end
return {
	EquipmentWrappManager = EquipmentWrappManager,
}
