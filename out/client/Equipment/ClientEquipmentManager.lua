-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EquipmentFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentFactory").EquipmentFactory
local ClientEquipmentRegister = TS.import(script, script.Parent, "ClientEquipmentRegister").ClientEquipmentRegister
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players = _services.Players
local ReplicatedStorage = _services.ReplicatedStorage
local BindedHotInventory = TS.import(script, script.Parent, "Inventory", "BindedHotInventory").BindedHotInventory
local EquipmentGlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentGlobalConfig").EquipmentGlobalConfig
local remote = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote")
local createdEquipmentEvent = remote:WaitForChild("Created")
local ClientEquipmentManager
do
	ClientEquipmentManager = setmetatable({}, {
		__tostring = function()
			return "ClientEquipmentManager"
		end,
	})
	ClientEquipmentManager.__index = ClientEquipmentManager
	function ClientEquipmentManager.new(...)
		local self = setmetatable({}, ClientEquipmentManager)
		return self:constructor(...) or self
	end
	function ClientEquipmentManager:constructor()
		self.register = ClientEquipmentRegister.new()
		self.factory = EquipmentFactory.new()
		self.hotInventory = BindedHotInventory.new(Players.LocalPlayer, EquipmentGlobalConfig.HOT_INVENTORY_SIZE)
	end
	function ClientEquipmentManager:Startup()
		createdEquipmentEvent.OnClientEvent:Connect(function(name, data)
			local equipment = self.factory:Create(Players.LocalPlayer, name, data)
			self.hotInventory:PushItem(self.register:RegsiterItem(equipment))
		end)
	end
end
return {
	ClientEquipmentManager = ClientEquipmentManager,
}
