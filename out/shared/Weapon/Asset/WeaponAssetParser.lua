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
		self.ASSET_DIR = weaponDir:WaitForChild("Assets")
		self.COMMON_ASSETS_DIR = self.ASSET_DIR:WaitForChild("Common")
		self.options = {
			SoundDirName = "Sounds",
			FireSoundName = "Fire",
			CommonParticlesDir = self.COMMON_ASSETS_DIR:WaitForChild("Particles"),
		}
	end
	function WeaponAssetParser:GetAssetsDir(name)
		return self.ASSET_DIR:WaitForChild(name)
	end
	function WeaponAssetParser:GetSoundsDir(assetsDir)
		return assetsDir:WaitForChild(self.options.SoundDirName)
	end
	function WeaponAssetParser:FindSoundsDir(name)
		local soundsDir = self:GetSoundsDir(self:GetAssetsDir(name))
		if not soundsDir then
			error("Not found sound-directory in assets for: " .. name)
		end
		return soundsDir
	end
	function WeaponAssetParser:ParseParticles()
		return {
			FireSmoke = self.options.CommonParticlesDir:WaitForChild("FireSmoke"):GetChildren(),
		}
	end
	function WeaponAssetParser:Parse(name)
		local particles = self:ParseParticles()
		local soundsDir = self:FindSoundsDir(name)
		local fireSound = soundsDir:WaitForChild("Fire")
		if not fireSound then
			error("Not found weapon fire sound for " .. name)
		end
		return {
			Sounds = {
				Fire = soundsDir:WaitForChild("Fire"),
			},
			Particles = {
				FireSmoke = particles.FireSmoke,
			},
		}
	end
end
return {
	WeaponAssetParser = WeaponAssetParser,
}
