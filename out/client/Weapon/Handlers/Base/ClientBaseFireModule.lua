-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponRayCasting = TS.import(script, script.Parent, "WeaponRayCasting").WeaponRayCasting
local ShotTrace = TS.import(script, script.Parent, "VisualEffects", "Trace", "ShotTrace").ShotTrace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local EntityStorageUnpacked = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityStorage", "EntityStorageUnpacked").EntityStorageUnpacked
local EntityStorageFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityStorage", "EntityStorageFactory").EntityStorageFactory
local BaseParticleSet = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ParticleEmitterSet", "BaseParticleSet").BaseParticleSet
local FireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "FireModule").FireModule
local BaseHitHandler = TS.import(script, script.Parent, "ClientBaseHitHandler").BaseHitHandler
local BaseFireHandler
do
	local super = FireModule
	BaseFireHandler = setmetatable({}, {
		__tostring = function()
			return "BaseFireHandler"
		end,
		__index = super,
	})
	BaseFireHandler.__index = BaseFireHandler
	function BaseFireHandler.new(...)
		local self = setmetatable({}, BaseFireHandler)
		return self:constructor(...) or self
	end
	function BaseFireHandler:constructor(owner, weaponData, model)
		super.constructor(self, owner, weaponData, model)
		self.hitHandler = BaseHitHandler.new()
		self.caster = WeaponRayCasting.new(owner)
		self.shotTrace = ShotTrace.new(self.weponModel)
		self.fireSound = self.weaponData.Assets.Sounds.Fire
		self.smokeParticleSet = BaseParticleSet.new(Instance.new("Attachment", self.weponModel.Muzzle)):AddByOrigin(self.weaponData.Assets.Particles.FireSmoke[1], {
			EmitParticleCount = 5,
		}):AddByOrigin(self.weaponData.Assets.Particles.FireSmoke[2], {
			EmitParticleCount = 10,
		})
		self.entityStorage = EntityStorageUnpacked.new(EntityStorageFactory:CreateByOtherTeams(self.currentOwner.Team, GlobalConfig.TAGS.DAMAGEBLE_ENTITY):AutoRegisterMode(true))
	end
	function BaseFireHandler:Fire()
		local res = self.caster:Cast()
		local rayRes = res.RaycastResult
		if rayRes then
			self.hitHandler:OnHit(rayRes)
			local entityGetRes = self.entityStorage:GetEntityByDescendant(rayRes.Instance)
			if entityGetRes.Result then
				self.hitHandler:OnHitEnity(entityGetRes.Entity, rayRes)
			else
				self.hitHandler:OnHitPart(rayRes)
			end
			self.shotTrace:Create(rayRes.Position)
		else
			self.shotTrace:Create(res.EndPoint)
		end
		self.fireSound:Play()
		self.smokeParticleSet:Emit()
		return self
	end
end
return {
	BaseFireHandler = BaseFireHandler,
}
