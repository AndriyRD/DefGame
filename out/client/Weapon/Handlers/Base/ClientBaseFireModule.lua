-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponRayCasting = TS.import(script, script.Parent, "WeaponRayCasting").WeaponRayCasting
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local EntityStorageFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityStorage", "EntityStorageFactory").EntityStorageFactory
local BaseParticleSet = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "ParticleEmitterSet", "BaseParticleSet").BaseParticleSet
local FireModule = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "FireModule", "FireModule").FireModule
local BaseHitHandler = TS.import(script, script.Parent, "ClientBaseHitHandler").BaseHitHandler
local BulletTrace = TS.import(script, script.Parent, "VisualEffects", "Trace2", "BulletTrace").BulletTrace
local BaseFireModule
do
	local super = FireModule
	BaseFireModule = setmetatable({}, {
		__tostring = function()
			return "BaseFireModule"
		end,
		__index = super,
	})
	BaseFireModule.__index = BaseFireModule
	function BaseFireModule.new(...)
		local self = setmetatable({}, BaseFireModule)
		return self:constructor(...) or self
	end
	function BaseFireModule:constructor(weaponData, model)
		super.constructor(self, weaponData, model)
		self.hitHandler = BaseHitHandler.new()
		self.bulletTrace = BulletTrace.new(self.weponModel.Muzzle)
		self.fireSound = self.weaponData.Assets.Sounds.Fire
		self.smokeParticleSet = BaseParticleSet.new(Instance.new("Attachment", self.weponModel.Muzzle)):AddByOrigin(self.weaponData.Assets.Particles.FireSmoke[1], {
			EmitParticleCount = 5,
		}):AddByOrigin(self.weaponData.Assets.Particles.FireSmoke[2], {
			EmitParticleCount = 10,
		})
		self.entityStorage = nil
	end
	function BaseFireModule:Dispose()
	end
	function BaseFireModule:OnChagneOwner(plr)
		self.caster = WeaponRayCasting.new(plr, self.weponModel.Model.GetInstance())
		self.entityStorage = EntityStorageFactory:CreateByOtherTeams(plr.Team, GlobalConfig.TAGS.DAMAGEBLE_ENTITY):AutoRegisterMode(true)
		return super.OnChagneOwner(self, plr)
	end
	function BaseFireModule:Fire()
		local _res = self.caster
		if _res ~= nil then
			_res = _res:Cast()
		end
		local res = _res
		if not res then
			return nil
		end
		local rayRes = res.RaycastResult
		if rayRes then
			self.hitHandler:OnHit(rayRes)
			local entityGetRes = self.entityStorage:GetEntityByDescendant(rayRes.Instance)
			if entityGetRes.Result then
				self.hitHandler:OnHitEnity(entityGetRes.Entity, rayRes)
			else
				self.hitHandler:OnHitPart(rayRes)
			end
			self.bulletTrace:Spawn(rayRes.Position)
		else
			self.bulletTrace:Spawn(res.EndPoint)
		end
		self.fireSound:Play()
		self.smokeParticleSet:Emit()
		self.weaponData.Ammo:GetMagazine():Take()
		return self
	end
end
return {
	BaseFireModule = BaseFireModule,
}
