import { IAmmoConfig } from "./IAmmoConfig";
import { Magazine } from "./Magazine";

export class AmmoContainer {
    private readonly magazine: Magazine
    private currentAmmo = 0
    readonly Events = {
        ChangeAmmo: new Instance("BindableEvent"),
        ChangeMagazine: new Instance("BindableEvent")
    }

    Reload() {
        if (this.currentAmmo <= 0) return
        const ammoCount = this.magazine.GetSize() - this.magazine.GetCurrentAmmo()
        
        if (ammoCount <= this.currentAmmo){
            this.currentAmmo -= ammoCount
            this.magazine.Reload()
        }

        else{
            this.magazine.AddAmmo(ammoCount)
        }

        this.Events.ChangeAmmo.Fire(this)
        this.Events.ChangeMagazine.Fire(this.magazine)
    }

    GetConfig(){
        return this.config
    }

    GetMagazine(){
        return this.magazine
    }

    constructor(private readonly config: IAmmoConfig){
        this.magazine = new Magazine(config.MagazineSize)
        this.currentAmmo = config.MaxAmmo
    }
}