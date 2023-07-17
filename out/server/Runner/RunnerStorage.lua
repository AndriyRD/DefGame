-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Runner = TS.import(script, game:GetService("ServerScriptService"), "TS", "Runner", "ServerRunner").Runner
local AutoRegisteredSinglePlayerStorage = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "PlayerStorage", "AutoRegisteredSinglePlayerStorage").AutoRegisteredSinglePlayerStorage
local RunnerStorageContainer
do
	local super = AutoRegisteredSinglePlayerStorage
	RunnerStorageContainer = setmetatable({}, {
		__tostring = function()
			return "RunnerStorageContainer"
		end,
		__index = super,
	})
	RunnerStorageContainer.__index = RunnerStorageContainer
	function RunnerStorageContainer.new(...)
		local self = setmetatable({}, RunnerStorageContainer)
		return self:constructor(...) or self
	end
	function RunnerStorageContainer:constructor(...)
		super.constructor(self, ...)
	end
	function RunnerStorageContainer:RemoveItem(plr)
		self:Get(plr):Dispose()
	end
	function RunnerStorageContainer:CreateItem(plr)
		return Runner.new(plr)
	end
end
return {
	RunnerStorageContainer = RunnerStorageContainer,
}
