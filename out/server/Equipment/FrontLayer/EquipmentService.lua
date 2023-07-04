-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local EquipmentFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentFactory").EquipmentFactory
local EquipmentInventoryStorage = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "EquipmentInventoryStorage").EquipmentInventoryStorage
local ServerEquipmentRegister = TS.import(script, game:GetService("ServerScriptService"), "TS", "Equipment", "ServerEquipmentRegister").ServerEquipmentRegister
local EquipmentService
do
	EquipmentService = setmetatable({}, {
		__tostring = function()
			return "EquipmentService"
		end,
	})
	EquipmentService.__index = EquipmentService
	function EquipmentService.new(...)
		local self = setmetatable({}, EquipmentService)
		return self:constructor(...) or self
	end
	function EquipmentService:constructor()
		self.factory = EquipmentFactory.new()
		self.equipmentRegister = ServerEquipmentRegister.new()
		self.storage = EquipmentInventoryStorage.new()
		self.ServiceHandlers = {}
		local _serviceHandlers = self.ServiceHandlers
		local _arg1 = function(plr, name)
			return self:AddEquipment(plr, name)
		end
		_serviceHandlers.CreateEquipment = _arg1
		local _serviceHandlers_1 = self.ServiceHandlers
		local _arg1_1 = function(plr, name)
			return self:SelectEquipment(plr, name)
		end
		_serviceHandlers_1.SelectEquipment = _arg1_1
	end
	function EquipmentService:GetId()
		return "Equipment"
	end
	function EquipmentService:AddEquipment(plr, name)
		local equipment = self.storage:GetOrCreate(plr):GetHotInventory():PushItem(self.equipmentRegister:RegsiterItem(self.factory:Create(plr, name, nil)))
		return { equipment:GetModel(), equipment:GetGrip() }
	end
	function EquipmentService:SelectEquipment(plr, name)
		self.storage:Get(plr):GetHotInventory():SelectByKey(name)
	end
end
return {
	EquipmentService = EquipmentService,
}
