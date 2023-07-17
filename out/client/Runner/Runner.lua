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
	function Runner:constructor(...)
		super.constructor(self, ...)
	end
	function Runner:Run()
		return self
	end
	function Runner:Stop()
		return self
	end
end
return {
	Runner = Runner,
}
