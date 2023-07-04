-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local PlayerStorageContainer = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "PlayerStorage", "PlayerStorageContainer").PlayerStorageContainer
local EquipmentStorage
do
	local super = PlayerStorageContainer
	EquipmentStorage = setmetatable({}, {
		__tostring = function()
			return "EquipmentStorage"
		end,
		__index = super,
	})
	EquipmentStorage.__index = EquipmentStorage
	function EquipmentStorage.new(...)
		local self = setmetatable({}, EquipmentStorage)
		return self:constructor(...) or self
	end
	function EquipmentStorage:constructor(...)
		super.constructor(self, ...)
	end
	function EquipmentStorage:AddEquipment(equipment)
		self:AddItem(equipment:GetOwner(), equipment:GetID(), equipment)
		return equipment
	end
end
return {
	EquipmentStorage = EquipmentStorage,
}
