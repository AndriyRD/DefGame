-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ContextActionService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local EquipmentGlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentGlobalConfig").EquipmentGlobalConfig
local HotInventory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "HotInventory").HotInventory
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BindedHotInventory
do
	local super = HotInventory
	BindedHotInventory = setmetatable({}, {
		__tostring = function()
			return "BindedHotInventory"
		end,
		__index = super,
	})
	BindedHotInventory.__index = BindedHotInventory
	function BindedHotInventory.new(...)
		local self = setmetatable({}, BindedHotInventory)
		return self:constructor(...) or self
	end
	function BindedHotInventory:constructor(...)
		super.constructor(self, ...)
		self.bindInventoryData = EquipmentGlobalConfig:GetBindData()
	end
	function BindedHotInventory:PushItem(equipment)
		local slotIndex = self:GetNewItemIndex()
		local bindData = self.bindInventoryData[slotIndex + 1]
		ContextActionService:BindAction(bindData.Action, function(name, state)
			if name == bindData.Action and state == Enum.UserInputState.Begin then
				self:SelectByKey(equipment:GetID())
			end
		end, false, bindData.Input)
		return super.PushItem(self, equipment)
	end
	function BindedHotInventory:SelectByKey(key)
		super.SelectByKey(self, key)
		RemoteProvider:GetForEquipment().Select:FireServer(key)
	end
end
return {
	BindedHotInventory = BindedHotInventory,
}
