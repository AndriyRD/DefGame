-- Compiled with roblox-ts v2.1.0
return function()
	local button = Instance.new("ProximityPrompt")
	button.Name = "Activate"
	button.ActionText = "Activate"
	button.HoldDuration = 0
	button.KeyboardKeyCode = Enum.KeyCode.E
	button.MaxActivationDistance = 5
	button.Enabled = true
	return button
end
