-- Compiled with roblox-ts v2.1.0
local Styles
do
	Styles = setmetatable({}, {
		__tostring = function()
			return "Styles"
		end,
	})
	Styles.__index = Styles
	function Styles.new(...)
		local self = setmetatable({}, Styles)
		return self:constructor(...) or self
	end
	function Styles:constructor()
	end
	Styles.Menu = {
		BackgroundColor = Color3.fromHex("#707070"),
		Transparency = .6,
	}
	Styles.ActiveRedColor = Color3.fromHex("#a72a2a")
	Styles.StandartBorderColor = BrickColor.White().Color
end
return {
	Styles = Styles,
}
