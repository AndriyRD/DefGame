import { AutoFire } from "shared/Weapon/FireModule/AutoFire";

type ModulesList = Array<{ID: string, FireModule: AutoFire}>

export class PlayerFireModules {
    private readonly list = new Map<Player, ModulesList>()

    GetOrCreateModules(plr: Player){
        let modules = this.list.get(plr)
        if (!modules) {
            this.list.set(plr, new Array())
            return this.list.get(plr)!
        }
        return modules
    }

    GetFireModule(plr: Player, id: string){
        let modules = this.GetOrCreateModules(plr)
        for (const item of modules)
            if (item.ID === id) return item
        error(`Not found weapon fire-module for: ${id}`)
    }

    Add(plr: Player, id: string, fireModule: AutoFire){
        this.GetOrCreateModules(plr).push({ID: id, FireModule: fireModule})
    }
}