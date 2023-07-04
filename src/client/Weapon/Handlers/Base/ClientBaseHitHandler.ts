import { Workspace } from "@rbxts/services";
import { GlobalConfig } from "shared/GlobalConfig";
import { IEntity } from "shared/IEntity";
import { IWeapon } from "shared/Weapon/IWeapon";
import { IHitHandler } from "shared/Weapon/WeaponHandler/IHitHandler";

const createPart = (pos: Vector3, color: BrickColor) => {
    const part = new Instance('Part')
    part.Parent = GlobalConfig.DEBRIS
    part.Size = new Vector3(.3,.3,.3)
    part.Anchored = true
    part.Position = pos
    part.Material = Enum.Material.Neon
    part.BrickColor = color
    part.CanCollide = false
    return part
}

export class BaseHitHandler implements IHitHandler {
    OnHit(res: RaycastResult): void {
    }

    OnHitPart(res: RaycastResult): void {
        createPart(res.Position, BrickColor.Black())
    }

    OnHitEnity(entity: IEntity, res: RaycastResult): void {
        createPart(res.Position, BrickColor.Red())
    }
    constructor(private readonly weapon: IWeapon){}
}