-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local BasePlayerStorage = TS.import(script, game:GetService("ServerScriptService"), "TS", "Core", "PlayerStorage", "BasePlayerStorage").BasePlayerStorage
local PlayerStorageContainer
do
	PlayerStorageContainer = setmetatable({}, {
		__tostring = function()
			return "PlayerStorageContainer"
		end,
	})
	PlayerStorageContainer.__index = PlayerStorageContainer
	function PlayerStorageContainer.new(...)
		local self = setmetatable({}, PlayerStorageContainer)
		return self:constructor(...) or self
	end
	function PlayerStorageContainer:constructor()
		self.StorageCotnaier = {}
		self.PLAYER_LEAVE_CONNECT = Players.PlayerRemoving:Connect(function(plr)
			return self:OnPlayerLeave(plr)
		end)
	end
	function PlayerStorageContainer:Get(player)
		local _storageCotnaier = self.StorageCotnaier
		local _player = player
		local storage = _storageCotnaier[_player]
		if storage then
			return storage
		else
			error("Not found player-storage for: " .. tostring(player))
		end
	end
	function PlayerStorageContainer:TryGet(player)
		local _storageCotnaier = self.StorageCotnaier
		local _player = player
		return _storageCotnaier[_player]
	end
	function PlayerStorageContainer:AddItem(player, key, item)
		local storage = self:TryGet(player)
		if not storage then
			storage = BasePlayerStorage.new(player)
		end
		storage:AddItem(key, item)
	end
	function PlayerStorageContainer:OnPlayerLeave(player)
		local storage = self:TryGet(player)
		if storage then
			storage:Unload()
			table.clear(storage)
			local _storageCotnaier = self.StorageCotnaier
			local _player = player
			_storageCotnaier[_player] = nil
		end
		warn("Unload player-data for: " .. tostring(player))
	end
end
return {
	PlayerStorageContainer = PlayerStorageContainer,
}
