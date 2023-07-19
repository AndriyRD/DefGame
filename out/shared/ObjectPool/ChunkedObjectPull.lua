-- Compiled with roblox-ts v2.1.0
local ChunkedObjectPull
do
	ChunkedObjectPull = setmetatable({}, {
		__tostring = function()
			return "ChunkedObjectPull"
		end,
	})
	ChunkedObjectPull.__index = ChunkedObjectPull
	function ChunkedObjectPull.new(...)
		local self = setmetatable({}, ChunkedObjectPull)
		return self:constructor(...) or self
	end
	function ChunkedObjectPull:constructor(objectPull)
		self.objectPull = objectPull
	end
	function ChunkedObjectPull:GetChunk(chunkSize)
		local items = self.objectPull:GetFreeItems()
		local res = {}
		for _, freeItem in items do
			local itemLifeTime = freeItem:GetLifeTime()
			local oldCounter = 0
			for _1, currentFreeItem in items do
				if itemLifeTime > currentFreeItem:GetLifeTime() then
					oldCounter += 1
				end
			end
			if oldCounter >= chunkSize then
				table.insert(res, freeItem)
			end
		end
		if #res > chunkSize then
			local _res = res
			local _arg0 = function(v, i)
				return i < chunkSize
			end
			-- ▼ ReadonlyArray.filter ▼
			local _newValue = {}
			local _length = 0
			for _k, _v in _res do
				if _arg0(_v, _k - 1, _res) == true then
					_length += 1
					_newValue[_length] = _v
				end
			end
			-- ▲ ReadonlyArray.filter ▲
			res = _newValue
		end
		return res
	end
	function ChunkedObjectPull:GetSize()
		return self.objectPull:GetSize()
	end
	function ChunkedObjectPull:Push(item)
		return self.objectPull:Push(item)
	end
	function ChunkedObjectPull:Take()
		return self.objectPull:Take()
	end
end
return {
	ChunkedObjectPull = ChunkedObjectPull,
}
