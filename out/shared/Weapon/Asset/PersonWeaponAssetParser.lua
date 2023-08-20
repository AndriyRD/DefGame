-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local WeaponAssetParser = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Asset", "WeaponAssetParser").WeaponAssetParser
local PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Weapon", "Asset", "PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES").PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES
local PersonWeaponAssetParser
do
	local super = WeaponAssetParser
	PersonWeaponAssetParser = setmetatable({}, {
		__tostring = function()
			return "PersonWeaponAssetParser"
		end,
		__index = super,
	})
	PersonWeaponAssetParser.__index = PersonWeaponAssetParser
	function PersonWeaponAssetParser.new(...)
		local self = setmetatable({}, PersonWeaponAssetParser)
		return self:constructor(...) or self
	end
	function PersonWeaponAssetParser:constructor(...)
		super.constructor(self, ...)
	end
	function PersonWeaponAssetParser:ParseAnimationSoundSet(dir, name)
		local soundSet = {}
		for _, item in dir:GetChildren() do
			if item:IsA("Sound") then
				local _name = item.Name
				soundSet[_name] = item
			end
		end
		return soundSet
	end
	function PersonWeaponAssetParser:ParseAnimatinoSoundSets(name)
		local dir = self:FindSoundsDir(name)
		return {
			Equip = self:ParseAnimationSoundSet(dir, PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES.EQUIP),
			Unequip = self:ParseAnimationSoundSet(dir, PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES.UNEQUIP),
			Reload = self:ParseAnimationSoundSet(dir, PERSON_WEAPON_ANIMATION_SOUND_SET_NAMES.RELOAD),
		}
	end
	function PersonWeaponAssetParser:Parse(name)
		local baseAssets = super.Parse(self, name)
		local soundSets = self:ParseAnimatinoSoundSets(name)
		return {
			Particles = baseAssets.Particles,
			Sounds = {
				Fire = baseAssets.Sounds.Fire,
				Equip = soundSets.Equip,
				Unequip = soundSets.Unequip,
				Reload = soundSets.Reload,
			},
		}
	end
end
return {
	PersonWeaponAssetParser = PersonWeaponAssetParser,
}
