export = () => {
    const button = new Instance('ProximityPrompt')
    button.Name = 'Activate'
    button.ActionText = 'Activate'
    button.HoldDuration = 0
    button.ClickablePrompt = true
    button.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
    button.KeyboardKeyCode = Enum.KeyCode.E
    button.MaxActivationDistance = 4.5
    button.RequiresLineOfSight = false
    button.Enabled = true
    return button
}