-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local EquipmentApi = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "FrontLayer", "EquipmnetAPI")
local remote = ReplicatedStorage:WaitForChild("Equipment"):WaitForChild("Remote")
local createdEquipmentEvent = remote:WaitForChild("Created")
local EquipmentEventListener
do
	EquipmentEventListener = setmetatable({}, {
		__tostring = function()
			return "EquipmentEventListener"
		end,
	})
	EquipmentEventListener.__index = EquipmentEventListener
	function EquipmentEventListener.new(...)
		local self = setmetatable({}, EquipmentEventListener)
		return self:constructor(...) or self
	end
	function EquipmentEventListener:constructor()
		self.equipmentServiceAPI = EquipmentApi.Import()
		self.dir = ReplicatedStorage:FindFirstChild("Equipment"):FindFirstChild("Remote")
		self.EventHandler = {}
		local _eventHandler = self.EventHandler
		local _arg1 = function(p, name)
			return self:OnCreateEquipment(p, name)
		end
		_eventHandler.CreateEquipment = _arg1
		local _eventHandler_1 = self.EventHandler
		local _arg1_1 = function(p, name)
			return self:OnSelectEquipment(p, name)
		end
		_eventHandler_1.SelectEquipment = _arg1_1
	end
	function EquipmentEventListener:GetId()
		return "equipment"
	end
	function EquipmentEventListener:GetEventDirecotry()
		return self.dir
	end
	function EquipmentEventListener:OnCreateEquipment(player, name)
		local data = self.equipmentServiceAPI.Create(player, name)
		local createEquipmentData = {
			Model = data[1],
			Grip = data[2],
		}
		createdEquipmentEvent:FireClient(player, name, createEquipmentData)
	end
	function EquipmentEventListener:OnSelectEquipment(player, name)
		self.equipmentServiceAPI.SelectEquipment(player, name)
	end
end
return {
	EquipmentEventListener = EquipmentEventListener,
}
