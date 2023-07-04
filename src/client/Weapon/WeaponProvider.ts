import { ClientWeaponManager } from "./ClientWeaponManager";

export class WeaponProvider{
    static readonly weaponManager = new ClientWeaponManager()
}