-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local SinglePlayerStorage = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "PlayerStorage", "SinglePlayerStorage").SinglePlayerStorage
local AutoRegisteredSinglePlayerStorage
do
	local super = SinglePlayerStorage
	AutoRegisteredSinglePlayerStorage = setmetatable({}, {
		__tostring = function()
			return "AutoRegisteredSinglePlayerStorage"
		end,
		__index = super,
	})
	AutoRegisteredSinglePlayerStorage.__index = AutoRegisteredSinglePlayerStorage
	function AutoRegisteredSinglePlayerStorage:constructor()
		super.constructor(self)
		self.connections = {
			OnPlayerJoin = Players.PlayerAdded:Connect(function(plr)
				return self:OnPlayerJoin(plr)
			end),
			OnPlayerLeave = Players.PlayerRemoving:Connect(function(plr)
				return self:OnPlayerLeave(plr)
			end),
		}
	end
	function AutoRegisteredSinglePlayerStorage:OnPlayerJoin(plr)
		local _items = self.items
		local _plr = plr
		local _arg1 = self:CreateItem(plr)
		_items[_plr] = _arg1
	end
	function AutoRegisteredSinglePlayerStorage:OnPlayerLeave(plr)
		self:RemoveItem(plr)
		local _items = self.items
		local _plr = plr
		_items[_plr] = nil
	end
end
return {
	AutoRegisteredSinglePlayerStorage = AutoRegisteredSinglePlayerStorage,
}
