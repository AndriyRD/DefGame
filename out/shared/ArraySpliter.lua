-- Compiled with roblox-ts v2.1.0
local ArraySpliter
do
	ArraySpliter = setmetatable({}, {
		__tostring = function()
			return "ArraySpliter"
		end,
	})
	ArraySpliter.__index = ArraySpliter
	function ArraySpliter.new(...)
		local self = setmetatable({}, ArraySpliter)
		return self:constructor(...) or self
	end
	function ArraySpliter:constructor()
	end
	function ArraySpliter:PopArrayElements(targetArr, count)
		local newItems = {}
		for i = 0, count - 1 do
			-- ▼ Array.pop ▼
			local _length = #targetArr
			local _result = targetArr[_length]
			targetArr[_length] = nil
			-- ▲ Array.pop ▲
			table.insert(newItems, _result)
		end
		return newItems
	end
	function ArraySpliter:Split(arr, size)
		local targetArrCopy = table.clone(arr)
		local containerArr = {}
		local containerArrSize = math.floor(#arr / size)
		for i = 0, containerArrSize do
			local _arg0 = ArraySpliter:PopArrayElements(targetArrCopy, size)
			table.insert(containerArr, _arg0)
		end
		print(#containerArr)
		return containerArr
	end
end
return {
	ArraySpliter = ArraySpliter,
}
