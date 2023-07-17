-- Compiled with roblox-ts v2.1.0
local VectorUtility
do
	VectorUtility = setmetatable({}, {
		__tostring = function()
			return "VectorUtility"
		end,
	})
	VectorUtility.__index = VectorUtility
	function VectorUtility.new(...)
		local self = setmetatable({}, VectorUtility)
		return self:constructor(...) or self
	end
	function VectorUtility:constructor()
	end
	function VectorUtility:CreateVectorByAxis(getAxis)
		return Vector3.new(getAxis(), getAxis(), getAxis())
	end
	function VectorUtility:CreateRandomVector(min, max)
		local getAxis = function()
			return self.random:NextNumber(min, max)
		end
		return self:CreateVectorByAxis(function()
			return getAxis()
		end)
	end
	VectorUtility.random = Random.new(tick())
end
return {
	VectorUtility = VectorUtility,
}
