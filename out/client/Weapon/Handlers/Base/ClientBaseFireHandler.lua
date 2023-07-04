-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponRayCasting = TS.import(script, script.Parent, "WeaponRayCasting").WeaponRayCasting
local ParticleController = TS.import(script, script.Parent, "VisualEffects", "ParticleController").ParticleController
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
		self.particleController = ParticleController.new()
		self.caster = WeaponRayCasting.new(weapon:GetOwner())
		self.muzzle = weapon:GetWeaponModel().Muzzle
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
		if res then
			self:OnHit(res)
			self.particleController:Shot(self.muzzle.CFrame, res.Position)
		end
		return self
	end
end
return {
	BaseFireHandler = BaseFireHandler,
}
