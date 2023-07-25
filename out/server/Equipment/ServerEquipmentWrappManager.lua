-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EQUIPMENT_TYPES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EQUIPMENTS_TYPES").EQUIPMENT_TYPES
local EquipmentWrappManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentWrappManager").EquipmentWrappManager
local ServerWeaponWrappedEquipment = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "Wrappers", "ServerWeaponWrappedEquipment.ts").ServerWeaponWrappedEquipment
local ServerEquipmentWrappManager
do
	ServerEquipmentWrappManager = setmetatable({}, {
		__tostring = function()
			return "ServerEquipmentWrappManager"
		end,
	})
	ServerEquipmentWrappManager.__index = ServerEquipmentWrappManager
	function ServerEquipmentWrappManager.new(...)
		local self = setmetatable({}, ServerEquipmentWrappManager)
		return self:constructor(...) or self
	end
	function ServerEquipmentWrappManager:constructor()
		self.manager = EquipmentWrappManager.new()
	end
	function ServerEquipmentWrappManager:Init()
		self.manager:AddFactory(EQUIPMENT_TYPES.WEAPON, function(e)
			return ServerWeaponWrappedEquipment.new(e)
		end)
	end
	function ServerEquipmentWrappManager:Wrap(equipment)
		self.manager:Wrap(equipment)
		return equipment
	end
end
return {
	ServerEquipmentWrappManager = ServerEquipmentWrappManager,
}
