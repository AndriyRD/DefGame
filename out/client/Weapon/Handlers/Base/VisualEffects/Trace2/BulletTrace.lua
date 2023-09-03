-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local FireBulletTrace = TS.import(script, script.Parent, "FireBulletTrace").FireBulletTrace
local SmokeBulletTrace = TS.import(script, script.Parent, "SmokeBulletTrace").SmokeBulletTrace
local BulletTrace
do
	BulletTrace = setmetatable({}, {
		__tostring = function()
			return "BulletTrace"
		end,
	})
	BulletTrace.__index = BulletTrace
	function BulletTrace.new(...)
		local self = setmetatable({}, BulletTrace)
		return self:constructor(...) or self
	end
	function BulletTrace:constructor(muzzlePart)
		self.muzzlePart = muzzlePart
		self.fireBulletTrace = FireBulletTrace.new()
		self.smokeBulletTrace = SmokeBulletTrace.new(muzzlePart)
		self.mouse = Players.LocalPlayer:GetMouse()
	end
	function BulletTrace:Fire(pos)
		self.fireBulletTrace:Spawn(self.muzzlePart.Position, pos)
		self.smokeBulletTrace:Spawn(pos)
	end
end
return {
	BulletTrace = BulletTrace,
}
