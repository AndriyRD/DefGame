export = () => {
    const button = new Instance('ProximityPrompt')
    button.Name = 'Activate'
    button.ActionText = 'Activate'
    button.HoldDuration = 0
    button.KeyboardKeyCode = Enum.KeyCode.E
    button.MaxActivationDistance = 5
    button.Enabled = true
    return button
}