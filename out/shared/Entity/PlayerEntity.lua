-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local HumanoidEntity = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "HumanoidEntity").HumanoidEntity
local GetCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "GetCharacter")
local PlayerEntity
do
	local super = HumanoidEntity
	PlayerEntity = setmetatable({}, {
		__tostring = function()
			return "PlayerEntity"
		end,
		__index = super,
	})
	PlayerEntity.__index = PlayerEntity
	function PlayerEntity.new(...)
		local self = setmetatable({}, PlayerEntity)
		return self:constructor(...) or self
	end
	function PlayerEntity:constructor(owner)
		super.constructor(self, GetCharacter(owner))
		self.owner = owner
		self.character = ReloadableCharacter.new(owner)
	end
	function PlayerEntity:OnDied()
		super.OnDied(self)
		self.model = self.character:GetCharacter()
		self.humanoid = self.character:GetHumanoid()
	end
	function PlayerEntity:GetModel()
		return self.character:GetCharacter()
	end
	function PlayerEntity:TakeDamage(value)
		self.character:GetHumanoid():TakeDamage(value)
		return self
	end
end
return {
	PlayerEntity = PlayerEntity,
}
