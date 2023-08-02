-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BulletHit = TS.import(script, script.Parent, "VisualEffects", "HitEffect", "BulletHit").BulletHit
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
		self.bulletHit = BulletHit.new()
		self.dmg = self.weapon:GetConfig().Damage
	end
	function BaseHitHandler:OnHit(res)
	end
	function BaseHitHandler:OnHitPart(res)
		self.bulletHit:Spawn(res.Instance, res.Position)
	end
	function BaseHitHandler:OnHitEnity(entity, res)
		entity:TakeDamage(self.dmg)
	end
end
return {
	BaseHitHandler = BaseHitHandler,
}
