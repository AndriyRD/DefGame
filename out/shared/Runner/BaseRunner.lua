-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReloadableCharacter = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").ReloadableCharacter
local Stamina = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Runner", "Stamina").Stamina
local BaseRunner
do
	BaseRunner = {}
	function BaseRunner:constructor(owner)
		self.owner = owner
		self.stamina = Stamina.new(100, 1)
		self.character = ReloadableCharacter.new(owner)
		self.stamina.OnEndStamina.Event:Connect(function()
			return self:Stop()
		end)
	end
end
return {
	BaseRunner = BaseRunner,
}
