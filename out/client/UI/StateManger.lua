-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local EventProvider = TS.import(script, script.Parent.Parent, "EventProvider").EventProvider
local StateManager
do
	StateManager = setmetatable({}, {
		__tostring = function()
			return "StateManager"
		end,
	})
	StateManager.__index = StateManager
	function StateManager.new(...)
		local self = setmetatable({}, StateManager)
		return self:constructor(...) or self
	end
	function StateManager:constructor()
	end
	function StateManager:RegsiterStamina()
		local screen = self.PlayerGUI:WaitForChild(self.ScreenNames.Stamina)
		EventProvider.Runner.Run.Event:Connect(function()
			screen.Enabled = true
			return screen.Enabled
		end)
		EventProvider.Runner.Stop.Event:Connect(function()
			screen.Enabled = false
			return screen.Enabled
		end)
	end
	StateManager.PlayerGUI = Players.LocalPlayer:WaitForChild("PlayerGui")
	StateManager.ScreenNames = {
		Stamina = "StaminaGui",
	}
end
return {
	StateManager = StateManager,
}
