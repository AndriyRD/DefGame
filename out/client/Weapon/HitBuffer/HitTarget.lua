-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalConfig = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "GlobalConfig").GlobalConfig
local HitTarget
do
	HitTarget = setmetatable({}, {
		__tostring = function()
			return "HitTarget"
		end,
	})
	HitTarget.__index = HitTarget
	function HitTarget.new(...)
		local self = setmetatable({}, HitTarget)
		return self:constructor(...) or self
	end
	function HitTarget:constructor()
	end
	function HitTarget:TakeDamage(item, v)
		if item:IsA("Humanoid") then
			item:TakeDamage(v)
		else
			local hp = self:GetHealth(item)
			if not (hp ~= 0 and (hp == hp and hp)) then
				error("Not found " .. (GlobalConfig.HP_ATTRIBUtE_NAME .. (" in " .. tostring(item))))
			end
			item:SetAttribute(GlobalConfig.HP_ATTRIBUtE_NAME, hp - v)
		end
		return self:GetHealth(item)
	end
	function HitTarget:GetHealth(item)
		if item:IsA("Humanoid") then
			return item.Health
		else
			return item:GetAttribute(GlobalConfig.HP_ATTRIBUtE_NAME)
		end
	end
end
return {
	HitTarget = HitTarget,
}
