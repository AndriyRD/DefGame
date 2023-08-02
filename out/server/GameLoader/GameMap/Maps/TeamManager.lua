-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Teams = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Teams
local TeamManager
do
	TeamManager = setmetatable({}, {
		__tostring = function()
			return "TeamManager"
		end,
	})
	TeamManager.__index = TeamManager
	function TeamManager.new(...)
		local self = setmetatable({}, TeamManager)
		return self:constructor(...) or self
	end
	function TeamManager:constructor()
	end
	function TeamManager:CreateTeam(color, name)
		if name == nil then
			name = color.Name
		end
		local team = Instance.new("Team", Teams)
		team.TeamColor = color
		team.AutoAssignable = false
		team.PlayerAdded:Connect(function(plr)
			return print("New player: " .. (tostring(plr) .. (" in team: " .. tostring(team))))
		end)
		team.Name = name
		return self
	end
end
return {
	TeamManager = TeamManager,
}
