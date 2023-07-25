-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local WeaponServiceAPI = TS.import(script, game:GetService("ServerScriptService"), "TS", "Weapon", "FrontLayer", "WeaponServiceAPI").WeaponServiceAPI
local ServerBaseWrappedEquipment = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "Wrappers", "ServerBaseWrappedEquipment").ServerBaseWrappedEquipment
local ServerWeaponWrappedEquipment
do
	local super = ServerBaseWrappedEquipment
	ServerWeaponWrappedEquipment = setmetatable({}, {
		__tostring = function()
			return "ServerWeaponWrappedEquipment"
		end,
		__index = super,
	})
	ServerWeaponWrappedEquipment.__index = ServerWeaponWrappedEquipment
	function ServerWeaponWrappedEquipment.new(...)
		local self = setmetatable({}, ServerWeaponWrappedEquipment)
		return self:constructor(...) or self
	end
	function ServerWeaponWrappedEquipment:constructor(equipment)
		super.constructor(self, equipment)
		self.equipment = equipment
		WeaponServiceAPI:Create(equipment:GetOwner(), equipment:GetModel())
	end
	function ServerWeaponWrappedEquipment:GetEquipmentType()
		return EQUIPMENT_TYPES.WEAPON
	end
	function ServerWeaponWrappedEquipment:Equip()
		return super.Equip(self)
	end
end
return {
	ServerWeaponWrappedEquipment = ServerWeaponWrappedEquipment,
}
