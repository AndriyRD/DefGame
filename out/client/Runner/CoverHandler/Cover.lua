-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local PartFace = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "PartApi", "PartFace").PartFace
local VectorUtility = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "VectorUtility").VectorUtility
local Cover
do
	local super = PartFace
	Cover = setmetatable({}, {
		__tostring = function()
			return "Cover"
		end,
		__index = super,
	})
	Cover.__index = Cover
	function Cover.new(...)
		local self = setmetatable({}, Cover)
		return self:constructor(...) or self
	end
	function Cover:constructor(...)
		super.constructor(self, ...)
		self.minDisatnceToEndPoint = .5
	end
	function Cover:GetDistacneToEndPoint(pos, toRight)
		if toRight then
			return VectorUtility:GetDistance(pos, self.endPoints.Right.Position)
		else
			return VectorUtility:GetDistance(pos, self.endPoints.Left.Position)
		end
	end
	function Cover:CanWatch(pos)
		local _value = self:GetDistacneToEndPoint(pos, true)
		if _value ~= 0 and (_value == _value and _value) then
			return true
		else
			local _value_1 = self:GetDistacneToEndPoint(pos, false)
			if _value_1 ~= 0 and (_value_1 == _value_1 and _value_1) then
				return true
			end
		end
		return false
	end
end
return {
	Cover = Cover,
}
