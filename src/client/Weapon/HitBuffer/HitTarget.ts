import { GlobalConfig } from "shared/GlobalConfig";

type HitTargetInstance = Humanoid | BasePart

export class HitTarget {
    private readonly inst
    TakeDamage: (v: number) => Instance
    GetHP: () => number

    GetInstance(){
        return this.inst
    }

    constructor(item: HitTargetInstance){
        if (item.IsA('Humanoid')){
            this.TakeDamage = (v) => {item.TakeDamage(v); return item}
            this.GetHP = () => item.Health
        }

        else{
            this.GetHP = () => item.GetAttribute(GlobalConfig.HP_ATTRIBUtE_NAME) as number

            this.TakeDamage = (v) => {
                const hp = this.GetHP()
                if (!hp) error(`Not found ${GlobalConfig.HP_ATTRIBUtE_NAME} in ${item}`)
                return item
            }
        }
            
        this.inst = item
    }
}