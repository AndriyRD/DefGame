-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponRayCasting = TS.import(script, script.Parent, "WeaponRayCasting").WeaponRayCasting
local ShotTrace = TS.import(script, script.Parent, "VisualEffects", "Trace", "ShotTrace").ShotTrace
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local EntityStorageUnpacked = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityStorage", "EntityStorageUnpacked").EntityStorageUnpacked
local EntityStorageFactory = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Entity", "EntityStorage", "EntityStorageFactory").EntityStorageFactory
local BaseFireHandler
do
	BaseFireHandler = setmetatable({}, {
		__tostring = function()
			return "BaseFireHandler"
		end,
	})
	BaseFireHandler.__index = BaseFireHandler
	function BaseFireHandler.new(...)
		local self = setmetatable({}, BaseFireHandler)
		return self:constructor(...) or self
	end
	function BaseFireHandler:constructor(weapon, hitHandler)
		self.weapon = weapon
		self.hitHandler = hitHandler
		self.caster = WeaponRayCasting.new(weapon:GetOwner())
		self.shotTrace = ShotTrace.new(self.weapon:GetWeaponModel())
		self.fireSound = self.weapon:GetAssets().Sounds.Fire
		self.entityStorage = EntityStorageUnpacked.new(EntityStorageFactory:CreateByOtherTeams(self.weapon:GetOwner().Team, GlobalConfig.TAGS.DAMAGEBLE_ENTITY):AutoRegisterMode(true))
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
		return self
	end
end
return {
	BaseFireHandler = BaseFireHandler,
}
