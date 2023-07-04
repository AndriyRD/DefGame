-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local SmokeGenerator = TS.import(script, script.Parent, "SmokeGenerator").SmokeGenerator
local ParticleController
do
	ParticleController = setmetatable({}, {
		__tostring = function()
			return "ParticleController"
		end,
	})
	ParticleController.__index = ParticleController
	function ParticleController.new(...)
		local self = setmetatable({}, ParticleController)
		return self:constructor(...) or self
	end
	function ParticleController:constructor()
		self.smokeGenerator = SmokeGenerator.new()
	end
	function ParticleController:Smoke(startPos, dir, distance)
		self.smokeGenerator:Generate(startPos, distance)
	end
	function ParticleController:Shot(start, endPos)
		local startPos = start.Position
		local dir = CFrame.lookAt(startPos, endPos)
		local _endPos = endPos
		local distance = (startPos - _endPos).Magnitude
		self:Smoke(start, dir.LookVector, distance)
	end
end
return {
	ParticleController = ParticleController,
}
