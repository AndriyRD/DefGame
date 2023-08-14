-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BulletHit = TS.import(script, script.Parent, "VisualEffects", "HitEffect", "BulletHit").BulletHit
local HitPackage = TS.import(script, script.Parent.Parent.Parent, "HitBuffer", "HitPackage").HitPackage
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local BaseHitHandler
do
	BaseHitHandler = setmetatable({}, {
		__tostring = function()
			return "BaseHitHandler"
		end,
	})
	BaseHitHandler.__index = BaseHitHandler
	function BaseHitHandler.new(...)
		local self = setmetatable({}, BaseHitHandler)
		return self:constructor(...) or self
	end
	function BaseHitHandler:constructor(weapon)
		self.weapon = weapon
		self.hitPackage = HitPackage.new(5, 2)
		self.sendHitPackegeEvent = RemoteProvider:GetForWeapon().HitPackage
		self.bulletHit = BulletHit.new()
		self.dmg = self.weapon:GetConfig().Damage
		self.hitPackage.OnReady.Event:Connect(function()
			return self.sendHitPackegeEvent:FireServer(self.hitPackage:GetResults())
		end)
	end
	function BaseHitHandler:OnHit(res)
	end
	function BaseHitHandler:OnHitPart(res)
		self.bulletHit:Spawn(res.Instance, res.Position)
	end
	function BaseHitHandler:OnHitEnity(entity, res)
		entity:TakeDamage(self.dmg)
		self.hitPackage:Push({
			Damage = self.dmg,
			Instance = res.Instance,
		})
	end
end
return {
	BaseHitHandler = BaseHitHandler,
}
