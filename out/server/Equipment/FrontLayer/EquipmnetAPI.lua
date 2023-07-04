-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ServerScriptService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ServerScriptService
return {
	Import = function()
		local dir = ServerScriptService:WaitForChild("Api"):WaitForChild("Equipment")
		return {
			Create = function(plr, name)
				return (dir:WaitForChild("CreateEquipment")):Invoke(plr, name)
			end,
			SelectEquipment = function(plr, name)
				return (dir:WaitForChild("SelectEquipment")):Invoke(plr, name)
			end,
		}
	end,
}
