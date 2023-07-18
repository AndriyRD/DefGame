-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseRunner = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Runner", "BaseRunner").BaseRunner
local Runner
do
	local super = BaseRunner
	Runner = setmetatable({}, {
		__tostring = function()
			return "Runner"
		end,
		__index = super,
	})
	Runner.__index = Runner
	function Runner.new(...)
		local self = setmetatable({}, Runner)
		return self:constructor(...) or self
	end
	function Runner:constructor(owner)
		super.constructor(self, owner)
		self.defaultSpeed = 16
		self.runSpeed = 24
		self.humanoid = self.character:GetHumanoid()
	end
	function Runner:Dispose()
		self.character:Destory()
		self.stamina:Dispose()
	end
	function Runner:Run()
		self.humanoid.WalkSpeed = self.runSpeed
		self.stamina:SetConsuptionMode(true)
		return self
	end
	function Runner:Stop()
		self.humanoid.WalkSpeed = self.defaultSpeed
		self.stamina:SetConsuptionMode(false)
		return self
	end
end
return {
	Runner = Runner,
}
