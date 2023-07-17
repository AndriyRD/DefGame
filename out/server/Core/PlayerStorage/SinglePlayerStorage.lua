-- Compiled with roblox-ts v2.1.0
local SinglePlayerStorage
do
	SinglePlayerStorage = {}
	function SinglePlayerStorage:constructor()
		self.items = {}
	end
	function SinglePlayerStorage:Get(player)
		local _items = self.items
		local _player = player
		local item = _items[_player]
		if not (item ~= 0 and (item == item and (item ~= "" and item))) then
			error("Not found item in storage for player: " .. tostring(player))
		end
		return item
	end
	function SinglePlayerStorage:GetOrCreate(player)
		local _items = self.items
		local _player = player
		local item = _items[_player]
		if not (item ~= 0 and (item == item and (item ~= "" and item))) then
			local _items_1 = self.items
			local _player_1 = player
			local _arg1 = self:CreateItem(player)
			_items_1[_player_1] = _arg1
			local _player_2 = player
			item = _items_1[_player_2]
		end
		return item
	end
end
return {
	SinglePlayerStorage = SinglePlayerStorage,
}
