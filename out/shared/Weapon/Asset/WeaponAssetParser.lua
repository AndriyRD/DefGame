-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local weaponDir = ReplicatedStorage:WaitForChild("Weapon")
local WeaponAssetParser
do
	WeaponAssetParser = setmetatable({}, {
		__tostring = function()
			return "WeaponAssetParser"
		end,
	})
	WeaponAssetParser.__index = WeaponAssetParser
	function WeaponAssetParser.new(...)
		local self = setmetatable({}, WeaponAssetParser)
		return self:constructor(...) or self
	end
	function WeaponAssetParser:constructor()
	end
	function WeaponAssetParser:ParseSounds(soundsDir)
		local sounds = {}
		for _, dirName in self.options.SoundsForAnimations do
			local soundDir = soundsDir:WaitForChild(dirName)
			if soundDir then
				local soundSet = {}
				for _1, item in soundDir:GetChildren() do
					if item:IsA("Sound") then
						local _name = item.Name
						soundSet[_name] = item
					end
				end
				sounds[dirName] = soundSet
			end
		end
		return sounds
	end
	function WeaponAssetParser:Parse(name)
		local assetsDir = self.ASSET_DIR:WaitForChild(name)
		local soundsDir = assetsDir:WaitForChild(self.options.SoundDirName)
		if not soundsDir then
			error("Not found sound-directory in assets for: " .. tostring(assetsDir))
		end
		local sounds = self:ParseSounds(soundsDir)
		return {
			Sounds = {
				Fire = soundsDir:WaitForChild(self.options.FireSoundName),
				Equip = sounds.Equip,
				Unequip = sounds.Unequip,
				Reload = sounds.Reload,
			},
		}
	end
	WeaponAssetParser.ASSET_DIR = weaponDir:WaitForChild("Assets")
	WeaponAssetParser.options = {
		SoundDirName = "Sounds",
		SoundsForAnimations = { "Reload", "Equip", "Unequip" },
		FireSoundName = "Fire",
	}
end
return {
	WeaponAssetParser = WeaponAssetParser,
}
