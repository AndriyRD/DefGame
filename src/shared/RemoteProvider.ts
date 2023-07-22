import { ReplicatedStorage } from "@rbxts/services";

export class RemoteProvider {
    private static readonly REMOTE_DIR_NAME = 'Remote'
    private static readonly dirs = {
        Runner: this.GetRemoteFolder('Runner'),
        Equipemnt: this.GetRemoteFolder('Equipemnt'),
        Weapon: this.GetRemoteFolder('Weapon'),
        Build: this.GetRemoteFolder('Build'),
        GameLoader: this.GetRemoteFolder('GameLoader')
    }

    private static GetRemoteFolder(dirName: string){
        return ReplicatedStorage.WaitForChild(dirName).WaitForChild(this.REMOTE_DIR_NAME)
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

    static GetForGameLoader(){
        return {
            NewSession: this.dirs.GameLoader.WaitForChild('NewSession') as RemoteEvent
        }
    }
}