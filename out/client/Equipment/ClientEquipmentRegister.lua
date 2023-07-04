-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local EquipmentRegister = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "EquipmentRegister").EquipmentRegister
local C_WeaponWrappedEquipment = TS.import(script, script.Parent, "Wrappers", "WeaponWrapper", "C_WeaponWrappedEquipment").C_WeaponWrappedEquipment
local ClientEquipmentRegister
do
	local super = EquipmentRegister
	ClientEquipmentRegister = setmetatable({}, {
		__tostring = function()
			return "ClientEquipmentRegister"
		end,
		__index = super,
	})
	ClientEquipmentRegister.__index = ClientEquipmentRegister
	function ClientEquipmentRegister.new(...)
		local self = setmetatable({}, ClientEquipmentRegister)
		return self:constructor(...) or self
	end
	function ClientEquipmentRegister:constructor()
		super.constructor(self)
		self.wrapManager:AddFactory(EQUIPMENT_TYPES.WEAPON, function(e)
			return C_WeaponWrappedEquipment.new(e)
		end)
	end
end
return {
	ClientEquipmentRegister = ClientEquipmentRegister,
}
