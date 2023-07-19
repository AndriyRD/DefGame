-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Workspace = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local CharatcerRaycaster = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "CharatcerRaycaster").CharatcerRaycaster
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local ShelterDetector
do
	local super = CharatcerRaycaster
	ShelterDetector = setmetatable({}, {
		__tostring = function()
			return "ShelterDetector"
		end,
		__index = super,
	})
	ShelterDetector.__index = ShelterDetector
	function ShelterDetector.new(...)
		local self = setmetatable({}, ShelterDetector)
		return self:constructor(...) or self
	end
	function ShelterDetector:constructor(character)
		super.constructor(self, character, { GlobalConfig.DEBRIS })
		self.character = character
		self.distance = 2.75
	end
	function ShelterDetector:Cast()
		local _fn = Workspace
		local _exp = self.root.Position
		local _lookVector = self.root.CFrame.LookVector
		local _distance = self.distance
		return _fn:Raycast(_exp, _lookVector * _distance, self.rayParams)
	end
	function ShelterDetector:SetDistance(value)
		self.distance = value
		return self
	end
end
return {
	ShelterDetector = ShelterDetector,
}
