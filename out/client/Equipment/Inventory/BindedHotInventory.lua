-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local CollectionService = _services.CollectionService
local ContextActionService = _services.ContextActionService
local EventProvider = TS.import(script, script.Parent.Parent.Parent, "EventProvider").EventProvider
local EquipmentGlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentGlobalConfig").EquipmentGlobalConfig
local HotInventory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "Inventory", "HotInventory").HotInventory
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
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
	function BindedHotInventory:constructor(owner, size)
		self.selectedItem = nil
		self.bindInventoryData = EquipmentGlobalConfig:GetBindData()
		EventProvider.Runner.Run.Event:Connect(function()
			return self:OnRun()
		end)
		EventProvider.Runner.Stop.Event:Connect(function()
			return self:OnStopRun()
		end)
		super.constructor(self, owner, size)
	end
	function BindedHotInventory:CanEquip()
		return not CollectionService:HasTag(self.owner, GlobalConfig.TAGS.RUN_STATE)
	end
	function BindedHotInventory:OnRun()
		if self.CurrentCell then
			self.selectedItem = self.CurrentCell.Equipment:GetID()
			self:SelectEmpty()
		end
	end
	function BindedHotInventory:OnStopRun()
		local _value = self.selectedItem
		if _value ~= "" and _value then
			self:SelectByKey(self.selectedItem)
			self.selectedItem = nil
		end
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
		if not self:CanEquip() then
			return nil
		end
		super.SelectByKey(self, key)
		RemoteProvider:GetForEquipment().Select:FireServer(key)
	end
	function BindedHotInventory:SelectEmpty()
		if self.CurrentCell then
			RemoteProvider:GetForEquipment().Select:FireServer(self.CurrentCell.Equipment:GetID())
			super.SelectEmpty(self)
		end
	end
end
return {
	BindedHotInventory = BindedHotInventory,
}
