import { GlobalConfig } from "shared/GlobalConfig";
import { IEntity } from "./IEntity";
import { RegenebleStat } from "shared/RegenebleStat";
import { CollectionService } from "@rbxts/services";

export class Entity implements IEntity{
    protected readonly healthStat
    readonly Events = {
        ChangeHealth: new Instance('BindableEvent'),
        Died: new Instance('BindableEvent')
    }

    protected GetHealthMaxValue(){
        return this.model.GetAttribute(
            GlobalConfig.ATTRIBUTES_NAMES.MAX_HEALTH_ATTRIBUTE_NAME) as number
    }

    GetModel(): Model {
        return this.model
    }

    TakeDamage(value: number): IEntity {
        this.healthStat.RegenPause(GlobalConfig.REGEN_HEALTH_PAUSE_AFTER_DAMAGE)
        this.healthStat.Update((v) => v-value)

        if(this.healthStat.GetValue() <= 0) this.Events.Died.Fire(this.model)
        else this.Events.ChangeHealth.Fire(this.model, this.healthStat.GetValue())
        return this
    }

    constructor(protected readonly model: Model){
        this.healthStat = new RegenebleStat(this.GetHealthMaxValue())
        CollectionService.AddTag(this.model, GlobalConfig.TAGS.ENTITY)
    }
}