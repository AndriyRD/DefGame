-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RemoteProvider = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "RemoteProvider").RemoteProvider
local HitPackage = TS.import(script, script.Parent, "HitPackage").HitPackage
local HitTarget = TS.import(script, script.Parent, "HitTarget").HitTarget
local HitBuffer
do
	HitBuffer = setmetatable({}, {
		__tostring = function()
			return "HitBuffer"
		end,
	})
	HitBuffer.__index = HitBuffer
	function HitBuffer.new(...)
		local self = setmetatable({}, HitBuffer)
		return self:constructor(...) or self
	end
	function HitBuffer:constructor()
		self.hitPackage = HitPackage.new(nil, nil)
		self.hitEvent = RemoteProvider:GetForWeapon().Hit
		self.hitPackage.OnReady.Event:Connect(function()
			return self:Send()
		end)
	end
	function HitBuffer:Send()
		self.hitEvent:FireServer(self.hitPackage:GetResults())
		self.hitPackage:Reset()
	end
	function HitBuffer:Buffer(inst, damage)
		if HitTarget:TakeDamage(inst, damage) > 0 then
			self.hitPackage:Push({
				Instance = inst,
				Damage = damage,
			})
		else
			self:Send()
		end
	end
end
return {
	HitBuffer = HitBuffer,
}
