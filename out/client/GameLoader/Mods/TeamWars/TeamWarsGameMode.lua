-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GAME_MODE_IDS = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GameLoader", "GAME_MODE_IDS").GAME_MODE_IDS
local BaseGameMode = TS.import(script, script.Parent.Parent, "BaseGameMode").BaseGameMode
local TeamScene = TS.import(script, script.Parent, "TeamScene").TeamScene
local TeamWarsGameMode
do
	local super = BaseGameMode
	TeamWarsGameMode = setmetatable({}, {
		__tostring = function()
			return "TeamWarsGameMode"
		end,
		__index = super,
	})
	TeamWarsGameMode.__index = TeamWarsGameMode
	function TeamWarsGameMode.new(...)
		local self = setmetatable({}, TeamWarsGameMode)
		return self:constructor(...) or self
	end
	function TeamWarsGameMode:constructor(...)
		super.constructor(self, ...)
		self.teamScene = TeamScene.new()
	end
	function TeamWarsGameMode:GetID()
		return GAME_MODE_IDS.TEAM_WARS
	end
	function TeamWarsGameMode:Run()
		-- TODO: this.teamScene.Show()
		return super.Run(self)
	end
end
return {
	TeamWarsGameMode = TeamWarsGameMode,
}
