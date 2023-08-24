-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Teams = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Teams
local TeamEventListener
do
	TeamEventListener = setmetatable({}, {
		__tostring = function()
			return "TeamEventListener"
		end,
	})
	TeamEventListener.__index = TeamEventListener
	function TeamEventListener.new(...)
		local self = setmetatable({}, TeamEventListener)
		return self:constructor(...) or self
	end
	function TeamEventListener:constructor()
		self.OnJoinToTeam = function(plr, teamName)
			local _exp = Teams:GetTeams()
			local _arg0 = function(v)
				return v.Name == teamName
			end
			-- ▼ ReadonlyArray.find ▼
			local _result
			for _i, _v in _exp do
				if _arg0(_v, _i - 1, _exp) == true then
					_result = _v
					break
				end
			end
			-- ▲ ReadonlyArray.find ▲
			plr.Team = _result
		end
	end
	function TeamEventListener:GetId()
		return "Team"
	end
end
return {
	TeamEventListener = TeamEventListener,
}
