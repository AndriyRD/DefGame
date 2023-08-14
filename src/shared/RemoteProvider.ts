import { ReplicatedStorage, Teams } from "@rbxts/services";

export class RemoteProvider {
    private static readonly REMOTE_DIR_NAME = 'Remote'
    private static readonly dirs = {
        Runner: RemoteProvider.GetRemoteFolder('Runner'),
        Equipment: RemoteProvider.GetRemoteFolder('Equipment'),
        Weapon: RemoteProvider.GetRemoteFolder('Weapon'),
        Build: RemoteProvider.GetRemoteFolder('Build'),
        GameLoader: RemoteProvider.GetRemoteFolder('GameLoader'),
        Team: RemoteProvider.GetRemoteFolder('Team')
    }

    private static GetRemoteFolder(dirName: string){
        return ReplicatedStorage.WaitForChild(dirName).WaitForChild(RemoteProvider.REMOTE_DIR_NAME)
    }

    static GetForEquipment(){
        return {
            Select: RemoteProvider.dirs.Equipment.WaitForChild('SelectEquipment') as RemoteEvent
        }
    }

    static GetForWeapon(){
        return {
            CreateWeapon: RemoteProvider.dirs.Weapon.WaitForChild('CreateWeapon') as RemoteEvent,
            HitPackage: RemoteProvider.dirs.Weapon.WaitForChild('HitPackage') as RemoteEvent,
            StartFire: RemoteProvider.dirs.Weapon.WaitForChild('StartFire') as RemoteEvent,
            StopFire: RemoteProvider.dirs.Weapon.WaitForChild('StopFire') as RemoteEvent,
            Reload: RemoteProvider.dirs.Weapon.WaitForChild('Reload') as RemoteEvent,
            Hit: RemoteProvider.dirs.Weapon.WaitForChild('Hit') as RemoteEvent
        }
    }

    static GetForBuild(){
        return {
            Build: RemoteProvider.dirs.Build.WaitForChild('Build') as RemoteEvent,
            BuildingAction: RemoteProvider.dirs.Build.WaitForChild('BuildingAction') as RemoteEvent 
        }
    }

    static GetForRunner(){
        return {
            Run: RemoteProvider.dirs.Runner.WaitForChild('Run') as RemoteEvent,
            Stop: RemoteProvider.dirs.Runner.WaitForChild('Stop') as RemoteEvent
        }
    }

    static GetForGameLoader(){
        return {
            NewSession: RemoteProvider.dirs.GameLoader.WaitForChild('NewSession') as RemoteEvent
        }
    }

    static GetTeam(){
        return {
            JoinToTeam: RemoteProvider.dirs.Team.WaitForChild('JoinToTeam') as RemoteEvent
        }
    }
}