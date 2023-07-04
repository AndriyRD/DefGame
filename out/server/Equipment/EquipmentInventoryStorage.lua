-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local SinglePlayerStorage = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "PlayerStorage", "SinglePlayerStorage").SinglePlayerStorage
local PlayerInventory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "PlayerInventory").PlayerInventory
local EquipmentInventoryStorage
do
	local super = SinglePlayerStorage
	EquipmentInventoryStorage = setmetatable({}, {
		__tostring = function()
			return "EquipmentInventoryStorage"
		end,
		__index = super,
	})
	EquipmentInventoryStorage.__index = EquipmentInventoryStorage
	function EquipmentInventoryStorage.new(...)
		local self = setmetatable({}, EquipmentInventoryStorage)
		return self:constructor(...) or self
	end
	function EquipmentInventoryStorage:constructor(...)
		super.constructor(self, ...)
	end
	function EquipmentInventoryStorage:CreateItem(plr)
		return PlayerInventory.new(plr)
	end
	function EquipmentInventoryStorage:Unload()
		-- TODO: Unload player inventory
		warn("Unload inventory for player")
	end
end
return {
	EquipmentInventoryStorage = EquipmentInventoryStorage,
}
