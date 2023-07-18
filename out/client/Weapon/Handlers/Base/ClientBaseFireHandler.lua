-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponRayCasting = TS.import(script, script.Parent, "WeaponRayCasting").WeaponRayCasting
local BulletHit = TS.import(script, script.Parent, "VisualEffects", "HitEffect", "BulletHit").BulletHit
local ShotTrace = TS.import(script, script.Parent, "VisualEffects", "Trace", "ShotTrace").ShotTrace
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
		self.bulletHit = BulletHit.new()
		self.fireSound = self.weapon:GetAssets().Sounds.Fire
	end
	function BaseFireHandler:OnHit(res)
		self.hitHandler:OnHit(res)
		local parent = res.Instance.Parent
		if parent and parent:IsA("Model") then
			local hum = parent:FindFirstChildOfClass("Humanoid")
			if hum then
				self.hitHandler:OnHitEnity({
					Charatcer = parent,
					Humanoid = hum,
				}, res)
			else
				self.hitHandler:OnHitPart(res)
			end
		end
	end
	function BaseFireHandler:Fire()
		local res = self.caster:Cast()
		local rayRes = res.RaycastResult
		if rayRes then
			self:OnHit(rayRes)
			coroutine.wrap(function()
				self.shotTrace:Create(rayRes.Instance, rayRes.Position)
				self.bulletHit:Spawn(rayRes.Instance, rayRes.Position)
			end)()
		else
			self.shotTrace:CreateWithoutParent(res.EndPoint)
		end
		self.fireSound:Play()
		return self
	end
end
return {
	BaseFireHandler = BaseFireHandler,
}
