-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ReplicatedStorage = _services.ReplicatedStorage
local RunService = _services.RunService
local EquipmentGlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Equipment", "EquipmentGlobalConfig").EquipmentGlobalConfig
local weaponDir = ReplicatedStorage:WaitForChild("Equipment")
local remote = weaponDir:WaitForChild("Remote")
local events = {
	equip = remote:WaitForChild("Equip"),
	unequip = remote:WaitForChild("Unequip"),
	craeteEquipment = remote:WaitForChild("CreateEquipment"),
}
local Equipment
do
	Equipment = setmetatable({}, {
		__tostring = function()
			return "Equipment"
		end,
	})
	Equipment.__index = Equipment
	function Equipment.new(...)
		local self = setmetatable({}, Equipment)
		return self:constructor(...) or self
	end
	function Equipment:constructor(id, owner, model, config, grip)
		self.id = id
		self.owner = owner
		self.model = model
		self.config = config
		self.grip = grip
		self:InitGrip()
		self.model.Parent = GetCharacter(owner)
		self.equiped = false
	end
	function Equipment:Reposition(orientationData)
		local grip = self:GetGrip()
		local char = GetCharacter(self:GetOwner())
		local bodyPart = char:WaitForChild(orientationData.BodyPartName)
		grip.Part0 = bodyPart
		grip.C0 = orientationData.Offset
		grip.Parent = self.model.PrimaryPart
	end
	function Equipment:InitGrip()
		self.grip.Name = self:GetID() .. EquipmentGlobalConfig.WEAPON_GRIP_NAME_POSTFIX
		self.grip.Part1 = self.model.PrimaryPart
		self:Reposition(self:GetConfig().Orientation.Unequip)
	end
	function Equipment:IsEquiped()
		return self.equiped
	end
	function Equipment:Equip()
		if RunService:IsServer() then
			self:Reposition(self:GetConfig().Orientation.Equip)
		end
		self.equiped = true
		return self
	end
	function Equipment:Unequip()
		if RunService:IsServer() then
			self:Reposition(self:GetConfig().Orientation.Unequip)
		end
		self.equiped = false
		return self
	end
	function Equipment:GetModel()
		return self.model
	end
	function Equipment:GetConfig()
		return self.config
	end
	function Equipment:GetGrip()
		return self.grip
	end
	function Equipment:GetOwner()
		return self.owner
	end
	function Equipment:GetID()
		return self.id
	end
	function Equipment:GetEquipmentType()
		return self.config.EquipmentType
	end
end
return {
	Equipment = Equipment,
}
