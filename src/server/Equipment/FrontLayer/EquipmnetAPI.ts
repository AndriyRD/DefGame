import { ServerScriptService } from "@rbxts/services";
export = {
    Import: () => {
        const dir = ServerScriptService.WaitForChild('Api').WaitForChild('Equipment')
        return {
            Create: (plr: Player, name: string) => 
                (dir.WaitForChild('CreateEquipment') as BindableFunction).Invoke(plr, name),
            SelectEquipment: (plr: Player, name: string) =>
                (dir.WaitForChild('SelectEquipment') as BindableFunction).Invoke(plr, name)
        }
    }
}