-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
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
		self.character = ReloadableCharacter.new(owner)
		self.equiped = false
	end
	function Equipment:IsEquiped()
		return self.equiped
	end
	function Equipment:Equip()
		-- if (RunService.IsServer())
		-- this.Reposition(this.GetConfig().Orientation.Equip)
		self.equiped = true
		return self
	end
	function Equipment:Unequip()
		-- if (RunService.IsServer())
		-- this.Reposition(this.GetConfig().Orientation.Unequip)
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
	function Equipment:GetCharacter()
		return self.character
	end
end
return {
	Equipment = Equipment,
}
