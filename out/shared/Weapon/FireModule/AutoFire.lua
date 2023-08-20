-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseGameLoop = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Loop", "BaseGameLoop").BaseGameLoop
local AutoFire
do
	AutoFire = setmetatable({}, {
		__tostring = function()
			return "AutoFire"
		end,
	})
	AutoFire.__index = AutoFire
	function AutoFire.new(...)
		local self = setmetatable({}, AutoFire)
		return self:constructor(...) or self
	end
	function AutoFire:constructor(fireModule)
		self.fireModule = fireModule
		self.work = false
		self.handleLoop = BaseGameLoop.new():SetTickRate(self.fireModule.weaponData.FireDelay)
		self.handleLoop:AddTask("main", function()
			fireModule:Fire()
		end)
	end
	function AutoFire:StartFire()
		if self.work then
			return nil
		end
		self.handleLoop:StartAsync()
		self.work = true
	end
	function AutoFire:StopFire()
		if not self.work then
			return nil
		end
		self.handleLoop:Stop()
		self.work = false
	end
end
return {
	AutoFire = AutoFire,
}
