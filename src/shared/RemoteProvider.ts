import { ReplicatedStorage } from "@rbxts/services";

export class RemoteProvider {
    private static readonly dirs = {
        Equipemnt: ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote'),
        Weapon: ReplicatedStorage.WaitForChild('Weapon').WaitForChild('Remote')
    }

    static GetForEquipment(){
        return {
            Select: this.dirs.Equipemnt.WaitForChild('SelectEquipment') as RemoteEvent
        }
    }

    static GetForWeapon(){
        return {
            CreateWeapon: this.dirs.Weapon.WaitForChild('CreateWeapon') as RemoteEvent,
            StartFire: this.dirs.Weapon.WaitForChild('StartFire') as RemoteEvent,
            StopFire: this.dirs.Weapon.WaitForChild('StopFire') as RemoteEvent
        }
    }
}