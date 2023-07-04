-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Inventory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "Inventory").Inventory
local HotInventory
do
	local super = Inventory
	HotInventory = setmetatable({}, {
		__tostring = function()
			return "HotInventory"
		end,
		__index = super,
	})
	HotInventory.__index = HotInventory
	function HotInventory.new(...)
		local self = setmetatable({}, HotInventory)
		return self:constructor(...) or self
	end
	function HotInventory:constructor(...)
		super.constructor(self, ...)
	end
	function HotInventory:SelectItem(index)
		if self.CurrentCell then
			self.CurrentCell.Equipment:Unequip()
			if self.CurrentCell.Index == index then
				self.CurrentCell = nil
				return self.CurrentCell
			end
		else
			self.CurrentCell = self:GetByIndex(index)
			self.CurrentCell.Equipment:Equip()
		end
	end
	function HotInventory:SelectByKey(key)
		local _cells = self.cells
		local _key = key
		local cell = _cells[_key]
		if cell then
			self:SelectItem(cell.Index)
		else
			error("Not found inventory-item: " .. key)
		end
	end
end
return {
	HotInventory = HotInventory,
}
