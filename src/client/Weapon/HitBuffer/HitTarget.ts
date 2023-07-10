import { GlobalConfig } from "shared/GlobalConfig";

type HitTargetInstance = Humanoid | BasePart

export class HitTarget {
    static TakeDamage(item: HitTargetInstance, v: number){
        if (item.IsA('Humanoid'))
            item.TakeDamage(v)
        else{
            const hp = this.GetHealth(item)
            if (!hp) error(`Not found ${GlobalConfig.HP_ATTRIBUtE_NAME} in ${item}`)
            item.SetAttribute(GlobalConfig.HP_ATTRIBUtE_NAME, hp-v)
        }
        return this.GetHealth(item)
    }

    static GetHealth(item: HitTargetInstance){
        if (item.IsA('Humanoid'))
            return item.Health
        else
            return item.GetAttribute(GlobalConfig.HP_ATTRIBUtE_NAME) as number
    }
}