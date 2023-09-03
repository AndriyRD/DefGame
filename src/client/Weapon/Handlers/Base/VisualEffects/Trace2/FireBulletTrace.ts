import { Debris, ReplicatedStorage, RunService } from "@rbxts/services";
import { GlobalConfig } from "shared/GlobalConfig";

export class FireBulletTrace {
    private speed = 800
    private readonly LIFE_TIME = 2
    private readonly bulletOrigin = ReplicatedStorage
        .WaitForChild("Weapon")
        .WaitForChild("Instances")
        .WaitForChild("Bullet") as BasePart

    Spawn(origin: Vector3, hit: Vector3){
        const newBullet = this.bulletOrigin.Clone()
        newBullet.Parent = GlobalConfig.DEBRIS
        newBullet.Position = origin
        const dir = CFrame.lookAt(origin, hit).LookVector

        RunService.Heartbeat.Connect(() =>
            newBullet.AssemblyLinearVelocity = dir.mul(this.speed))
        Debris.AddItem(newBullet, this.LIFE_TIME)
    }
}