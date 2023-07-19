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
	function VectorUtility:NormalToFaceID(normal)
		local THETA = .001
		for _, noramlID in VectorUtility.FaceNormalIDs do
			if Vector3.FromNormalId(noramlID):Dot(normal) > (1 - THETA) then
				return noramlID
			end
		end
		error("Not correct normal: " .. tostring(normal))
	end
	function VectorUtility:NormalIDToVector(part, normalID)
		return part.CFrame:PointToWorldSpace(Vector3.FromNormalId(normalID))
	end
	function VectorUtility:NoramlToSurfaceWorldNormal(part, normal)
		local surfaceID = VectorUtility:NormalToFaceID(normal)
		local _exp = Vector3.FromNormalId(surfaceID)
		local _arg0 = part.Size / 2
		local objectPoint = _exp * _arg0
		return part.CFrame:PointToWorldSpace(objectPoint)
	end
	VectorUtility.random = Random.new(tick())
	VectorUtility.FaceNormalIDs = { Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Bottom, Enum.NormalId.Top, Enum.NormalId.Left, Enum.NormalId.Right }
end
return {
	VectorUtility = VectorUtility,
}
