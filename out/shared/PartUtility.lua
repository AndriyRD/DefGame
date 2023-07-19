-- Compiled with roblox-ts v2.1.0
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
	function PartUtility:GetFaceSize(part, normalID)
		local axisName = self.facesAxis[normalID.Value]
		if axisName == "X" then
			return part.Size.X
		elseif axisName == "Y" then
			return part.Size.Y
		elseif axisName == "Z" then
			return part.Size.Z
		end
		error("Not found axis by normalID: " .. tostring(normalID))
	end
	PartUtility.facesAxis = {
		[Enum.NormalId.Back.Value] = "X",
		[Enum.NormalId.Front.Value] = "X",
		[Enum.NormalId.Left.Value] = "Z",
		[Enum.NormalId.Right.Value] = "Z",
		[Enum.NormalId.Top.Value] = "Y",
		[Enum.NormalId.Bottom.Value] = "Y",
	}
end
return {
	PartUtility = PartUtility,
}
