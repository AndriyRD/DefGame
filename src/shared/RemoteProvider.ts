import { ReplicatedStorage } from "@rbxts/services";

export class RemoteProvider {
    private static readonly dirs = {
        Runner: ReplicatedStorage.WaitForChild('Runner').WaitForChild('Remote'),
        Equipemnt: ReplicatedStorage.WaitForChild('Equipment').WaitForChild('Remote'),
        Weapon: ReplicatedStorage.WaitForChild('Weapon').WaitForChild('Remote'),
        Build: ReplicatedStorage.WaitForChild('Build').WaitForChild('Remote')
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
            StopFire: this.dirs.Weapon.WaitForChild('StopFire') as RemoteEvent,
            Reload: this.dirs.Weapon.WaitForChild('Reload') as RemoteEvent,
            Hit: this.dirs.Weapon.WaitForChild('Hit') as RemoteEvent
        }
    }

    static GetForBuild(){
        return {
            Build: this.dirs.Build.WaitForChild('Build') as RemoteEvent
        }
    }

    static GetForRunner(){
        return {
            Run: this.dirs.Runner.WaitForChild('Run') as RemoteEvent,
            Stop: this.dirs.Runner.WaitForChild('Stop') as RemoteEvent
        }
    }
}