-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Debris = _services.Debris
local ReplicatedStorage = _services.ReplicatedStorage
local RunService = _services.RunService
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local FireBulletTrace
do
	FireBulletTrace = setmetatable({}, {
		__tostring = function()
			return "FireBulletTrace"
		end,
	})
	FireBulletTrace.__index = FireBulletTrace
	function FireBulletTrace.new(...)
		local self = setmetatable({}, FireBulletTrace)
		return self:constructor(...) or self
	end
	function FireBulletTrace:constructor()
		self.speed = 800
		self.LIFE_TIME = 2
		self.bulletOrigin = ReplicatedStorage:WaitForChild("Weapon"):WaitForChild("Instances"):WaitForChild("Bullet")
	end
	function FireBulletTrace:Spawn(origin, hit)
		local newBullet = self.bulletOrigin:Clone()
		newBullet.Parent = GlobalConfig.DEBRIS
		newBullet.Position = origin
		local dir = CFrame.lookAt(origin, hit).LookVector
		RunService.Heartbeat:Connect(function()
			local _speed = self.speed
			newBullet.AssemblyLinearVelocity = dir * _speed
			return newBullet.AssemblyLinearVelocity
		end)
		Debris:AddItem(newBullet, self.LIFE_TIME)
	end
end
return {
	FireBulletTrace = FireBulletTrace,
}
