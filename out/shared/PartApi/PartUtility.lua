-- Compiled with roblox-ts v2.1.0
local AXIS
do
	local _inverse = {}
	AXIS = setmetatable({}, {
		__index = _inverse,
	})
	AXIS.X = "X"
	_inverse.X = "X"
	AXIS.Y = "Y"
	_inverse.Y = "Y"
	AXIS.Z = "Z"
	_inverse.Z = "Z"
end
local PartUtility
do
	PartUtility = setmetatable({}, {
		__tostring = function()
			return "PartUtility"
		end,
	})
	PartUtility.__index = PartUtility
	function PartUtility.new(...)
		local self = setmetatable({}, PartUtility)
		return self:constructor(...) or self
	end
	function PartUtility:constructor()
	end
	function PartUtility:IsPositiveAxisByNormalID(normalID)
		if normalID == Enum.NormalId.Front or (normalID == Enum.NormalId.Right or normalID == Enum.NormalId.Top) then
			return true
		else
			return false
		end
	end
	function PartUtility:GetFaceSize(part, normalID)
		local axisName = self.facesAxis[normalID.Value]
		if axisName == AXIS.X then
			local _vector3 = Vector3.new(1, 0, 0)
			local _x = part.Size.X
			return _vector3 * _x
		elseif axisName == AXIS.Y then
			local _vector3 = Vector3.new(0, 1, 0)
			local _y = part.Size.Y
			return _vector3 * _y
		elseif axisName == AXIS.Z then
			local _vector3 = Vector3.new(0, 0, 1)
			local _z = part.Size.Z
			return _vector3 * _z
		end
		error("Not found axis by normalID: " .. tostring(normalID))
	end
	function PartUtility:CreatePart(pos, parent)
		local part = Instance.new("Part", parent)
		part.BrickColor = BrickColor.Red()
		part.Anchored = true
		part.CanCollide = false
		part.Material = Enum.Material.Neon
		part.Size = Vector3.new(.5, .5, .5)
		part.Position = pos
		return part
	end
	PartUtility.facesAxis = {
		[Enum.NormalId.Back.Value] = AXIS.X,
		[Enum.NormalId.Front.Value] = AXIS.X,
		[Enum.NormalId.Left.Value] = AXIS.Z,
		[Enum.NormalId.Right.Value] = AXIS.Z,
		[Enum.NormalId.Top.Value] = AXIS.Y,
		[Enum.NormalId.Bottom.Value] = AXIS.Y,
	}
end
return {
	AXIS = AXIS,
	PartUtility = PartUtility,
}
