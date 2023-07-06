-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BuildController = TS.import(script, script.Parent, "BuildController").BuildController
local PlayerBuildModule
do
	PlayerBuildModule = setmetatable({}, {
		__tostring = function()
			return "PlayerBuildModule"
		end,
	})
	PlayerBuildModule.__index = PlayerBuildModule
	function PlayerBuildModule.new(...)
		local self = setmetatable({}, PlayerBuildModule)
		return self:constructor(...) or self
	end
	function PlayerBuildModule:constructor()
	end
	function PlayerBuildModule:BindBuild()
	end
	function PlayerBuildModule:BindCancel()
	end
	function PlayerBuildModule:BindRotation()
	end
	function PlayerBuildModule:Bind()
	end
	function PlayerBuildModule:BuildMode()
	end
	PlayerBuildModule.controller = BuildController.new()
end
return {
	PlayerBuildModule = PlayerBuildModule,
}
