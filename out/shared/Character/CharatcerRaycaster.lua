-- Compiled with roblox-ts v2.1.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CHARACTER_LOAD_EVENT_NAMES = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Character", "ReloadableCharacter").CHARACTER_LOAD_EVENT_NAMES
local CharatcerRaycaster
do
	CharatcerRaycaster = setmetatable({}, {
		__tostring = function()
			return "CharatcerRaycaster"
		end,
	})
	CharatcerRaycaster.__index = CharatcerRaycaster
	function CharatcerRaycaster.new(...)
		local self = setmetatable({}, CharatcerRaycaster)
		return self:constructor(...) or self
	end
	function CharatcerRaycaster:constructor(charcter, ignoreList)
		self.charcter = charcter
		self.rayParams = RaycastParams.new()
		self.rayParams.FilterType = Enum.RaycastFilterType.Exclude
		self.rayParams.FilterDescendantsInstances = { self.charcter:GetCharacter() }
		self.root = self.charcter:GetRoot()
		local _events = self.charcter.Events
		local _rOOT = CHARACTER_LOAD_EVENT_NAMES.ROOT
		local _result = _events[_rOOT]
		if _result ~= nil then
			_result = _result.Event:Connect(function(root)
				self.root = root
				local ignore = if ignoreList then ignoreList else {}
				local _array = { self.charcter:GetCharacter() }
				local _length = #_array
				table.move(ignore, 1, #ignore, _length + 1, _array)
				self.rayParams.FilterDescendantsInstances = _array
			end)
		end
	end
end
return {
	CharatcerRaycaster = CharatcerRaycaster,
}
