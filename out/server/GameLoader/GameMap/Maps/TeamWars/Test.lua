-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GameMap = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMap", "GameMap").GameMap
local TeamManager = TS.import(script, game:GetService("ServerScriptService"), "TS", "GameLoader", "GameMap", "Maps", "TeamManager").TeamManager
local Test
do
	local super = GameMap
	Test = setmetatable({}, {
		__tostring = function()
			return "Test"
		end,
		__index = super,
	})
	Test.__index = Test
	function Test.new(...)
		local self = setmetatable({}, Test)
		return self:constructor(...) or self
	end
	function Test:constructor()
		super.constructor(self, script.Name)
		self.teamManager = TeamManager.new()
		self.id = "Test"
	end
	function Test:Sapwn()
		self.teamManager:CreateTeam(BrickColor.Blue(), "Blue"):CreateTeam(BrickColor.Red(), "Red")
		super.Sapwn(self)
	end
end
return {
	Test = Test,
}
