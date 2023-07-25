import { Players } from "@rbxts/services";

export = () => Players.LocalPlayer.WaitForChild('PlayerGui') as PlayerGui