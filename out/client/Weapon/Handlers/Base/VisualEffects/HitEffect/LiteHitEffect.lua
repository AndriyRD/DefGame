-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local MaterialShards = TS.import(script, script.Parent, "MaterialShards").MaterialShards
local LiteHitEffect
do
	LiteHitEffect = setmetatable({}, {
		__tostring = function()
			return "LiteHitEffect"
		end,
	})
	LiteHitEffect.__index = LiteHitEffect
	function LiteHitEffect.new(...)
		local self = setmetatable({}, LiteHitEffect)
		return self:constructor(...) or self
	end
	function LiteHitEffect:constructor()
		self.countOfShards = NumberRange.new(0, 3)
		self.materialShards = MaterialShards.new()
		self.materials = { Enum.Material.SmoothPlastic, Enum.Material.Plastic, Enum.Material.Wood }
	end
	function LiteHitEffect:Hit(pos, material)
		local count = math.random(self.countOfShards.Min, self.countOfShards.Max)
		if count > 0 then
			self.materialShards:Spawn(pos, count, material)
		end
	end
	function LiteHitEffect:GetMaterials()
		return self.materials
	end
end
return {
	LiteHitEffect = LiteHitEffect,
}
