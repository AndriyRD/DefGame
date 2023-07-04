-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EquipmentGlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentGlobalConfig").EquipmentGlobalConfig
local HotInventory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "HotInventory").HotInventory
local PlayerInventory
do
	PlayerInventory = setmetatable({}, {
		__tostring = function()
			return "PlayerInventory"
		end,
	})
	PlayerInventory.__index = PlayerInventory
	function PlayerInventory.new(...)
		local self = setmetatable({}, PlayerInventory)
		return self:constructor(...) or self
	end
	function PlayerInventory:constructor(owner)
		self.owner = owner
		self.hotInventory = HotInventory.new(owner, EquipmentGlobalConfig.HOT_INVENTORY_SIZE)
	end
	function PlayerInventory:GetHotInventory()
		return self.hotInventory
	end
end
return {
	PlayerInventory = PlayerInventory,
}
