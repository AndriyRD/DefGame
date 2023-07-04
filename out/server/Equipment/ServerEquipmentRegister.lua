-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local EquipmentRegister = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "EquipmentRegister").EquipmentRegister
local S_WeaponWrappedEquipment = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "Wrappers", "S_WeaponWrappedEquipment.ts").S_WeaponWrappedEquipment
local ServerEquipmentRegister
do
	local super = EquipmentRegister
	ServerEquipmentRegister = setmetatable({}, {
		__tostring = function()
			return "ServerEquipmentRegister"
		end,
		__index = super,
	})
	ServerEquipmentRegister.__index = ServerEquipmentRegister
	function ServerEquipmentRegister.new(...)
		local self = setmetatable({}, ServerEquipmentRegister)
		return self:constructor(...) or self
	end
	function ServerEquipmentRegister:constructor()
		super.constructor(self)
		self.wrapManager:AddFactory(EQUIPMENT_TYPES.WEAPON, function(e)
			return S_WeaponWrappedEquipment.new(e)
		end)
	end
end
return {
	ServerEquipmentRegister = ServerEquipmentRegister,
}
