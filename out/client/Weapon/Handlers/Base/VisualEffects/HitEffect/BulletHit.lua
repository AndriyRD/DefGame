-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local LiteHitEffect = TS.import(script, script.Parent, "LiteHitEffect").LiteHitEffect
local BulletHit
do
	BulletHit = setmetatable({}, {
		__tostring = function()
			return "BulletHit"
		end,
	})
	BulletHit.__index = BulletHit
	function BulletHit.new(...)
		local self = setmetatable({}, BulletHit)
		return self:constructor(...) or self
	end
	function BulletHit:constructor()
		self.defaultHitEffect = LiteHitEffect.new()
		self.hitEffects = {}
		local _hitEffects = self.hitEffects
		local _defaultHitEffect = self.defaultHitEffect
		table.insert(_hitEffects, _defaultHitEffect)
	end
	function BulletHit:GetHitEffectByMaterial(hitMaterial)
		for _, item in self.hitEffects do
			for _1, material in item:GetMaterials() do
				if material == hitMaterial then
					return item
				end
			end
		end
	end
	function BulletHit:Spawn(part, pos)
		local hitEffect = self:GetHitEffectByMaterial(part.Material)
		if not self.GetHitEffectByMaterial then
			hitEffect = self.defaultHitEffect
		end
		hitEffect:Hit(pos, part.Material)
	end
end
return {
	BulletHit = BulletHit,
}
