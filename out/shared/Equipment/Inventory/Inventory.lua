-- Compiled with roblox-ts v2.1.0
local Inventory
do
	Inventory = setmetatable({}, {
		__tostring = function()
			return "Inventory"
		end,
	})
	Inventory.__index = Inventory
	function Inventory.new(...)
		local self = setmetatable({}, Inventory)
		return self:constructor(...) or self
	end
	function Inventory:constructor(owner, size)
		self.owner = owner
		self.size = size
		self.cells = {}
	end
	function Inventory:CanPushItem()
		-- ▼ ReadonlyMap.size ▼
		local _size = 0
		for _ in self.cells do
			_size += 1
		end
		-- ▲ ReadonlyMap.size ▲
		return _size < self.size
	end
	function Inventory:GetNewItemIndex()
		-- ▼ ReadonlyMap.size ▼
		local _size = 0
		for _ in self.cells do
			_size += 1
		end
		-- ▲ ReadonlyMap.size ▲
		return _size
	end
	function Inventory:PushItem(equipment)
		if self:CanPushItem() then
			local _cells = self.cells
			local _arg0 = equipment:GetID()
			local _arg1 = {
				Equipment = equipment,
				Index = self:GetNewItemIndex(),
			}
			_cells[_arg0] = _arg1
		end
		return equipment
	end
	function Inventory:RemoveItem(key)
		local _cells = self.cells
		local _key = key
		local cell = _cells[_key]
		if cell then
			local _cells_1 = self.cells
			local _key_1 = key
			_cells_1[_key_1] = nil
		else
			error("Not found registered item " .. (key .. ([[ in 
            inventory of player: ]] .. tostring(self.owner))))
		end
		return self
	end
	function Inventory:TryGetByIndex(index)
		for _k, _v in self.cells do
			local e = { _k, _v }
			local cell = e[2]
			if cell.Index == index then
				return cell
			end
		end
	end
	function Inventory:GetByIndex(index)
		if index > self.size then
			error("The index is too large. Indetory: " .. tostring(self.owner))
		end
		local res = self:TryGetByIndex(index)
		if not res then
			error("Not found inventory cell by index: " .. tostring(index))
		end
		return res
	end
	function Inventory:Swap(indexA, IndexB)
	end
end
return {
	Inventory = Inventory,
}
