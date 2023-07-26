-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseGameLoop = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "BaseGameLoop").BaseGameLoop
local AutoFireModule
do
	AutoFireModule = setmetatable({}, {
		__tostring = function()
			return "AutoFireModule"
		end,
	})
	AutoFireModule.__index = AutoFireModule
	function AutoFireModule.new(...)
		local self = setmetatable({}, AutoFireModule)
		return self:constructor(...) or self
	end
	function AutoFireModule:constructor(weaponContainer)
		self.weaponContainer = weaponContainer
		self.work = false
		self.weapon = weaponContainer:GetWeapon()
		self.handleLoop = BaseGameLoop.new():SetTickRate(self.weapon:GetFireDelay())
		self.handleLoop:AddTask("main", function()
			weaponContainer:Fire()
		end)
	end
	function AutoFireModule:StartFire()
		if self.work then
			return nil
		end
		self.handleLoop:StartAsync()
		self.work = true
	end
	function AutoFireModule:StopFire()
		if not self.work then
			return nil
		end
		self.handleLoop:Stop()
		self.work = false
	end
end
return {
	AutoFireModule = AutoFireModule,
}
