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
		self.options = {}
	end
	function WeaponAssetParser:Parse(name)
		local dir = self.ASSET_DIR:WaitForChild(name)
		-- TODO: Parse weapon assets
		return {
			Sounds = {
				Fire = Instance.new("Sound"),
				Equip = {},
				Unequip = {},
				Relaod = {},
			},
		}
	end
	WeaponAssetParser.ASSET_DIR = weaponDir:WaitForChild("Assets")
end
return {
	WeaponAssetParser = WeaponAssetParser,
}
