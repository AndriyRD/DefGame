-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local VectorUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "VectorUtility").VectorUtility
local PartUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "PartApi", "PartUtility").PartUtility
local PartFace
do
	PartFace = setmetatable({}, {
		__tostring = function()
			return "PartFace"
		end,
	})
	PartFace.__index = PartFace
	function PartFace.new(...)
		local self = setmetatable({}, PartFace)
		return self:constructor(...) or self
	end
	function PartFace:constructor(part, surfaceNormal)
		self.part = part
		self.surfaceNormal = surfaceNormal
		self.normalID = VectorUtility:NormalToFaceID(part.CFrame, surfaceNormal)
		self.CF = self:ParseCF(self.surfaceNormal)
		self.faceSize = self:ParceFaceSize()
		self.endPoints = self:ParseEndpoints()
	end
	function PartFace:GetEnPoint(positiveAxis)
		local _exp = self.faceSize / 2
		local _arg0 = if positiveAxis then 1 else -1
		local sizeOffset = _exp * _arg0
		return self.CF:ToWorldSpace(CFrame.new(sizeOffset))
	end
	function PartFace:ParseCF(normal)
		local _cf = CFrame.new(VectorUtility:NoramlToSurfaceWorldNormal(self.part, normal))
		local __cf = _cf
		local _rotation = self.part.CFrame.Rotation
		return __cf * _rotation
	end
	function PartFace:ParseEndpoints()
		return {
			Left = self:GetEnPoint(false),
			Right = self:GetEnPoint(true),
		}
	end
	function PartFace:ParceFaceSize()
		return PartUtility:GetFaceSize(self.part, self.normalID)
	end
	function PartFace:GetCFrame()
		return self.CF
	end
	function PartFace:GetEndRightPoint()
		return self.endPoints.Right
	end
	function PartFace:GetEndLeftPoint()
		return self.endPoints.Left
	end
end
return {
	PartFace = PartFace,
}
