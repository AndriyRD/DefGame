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
        const value = this.model.GetAttribute(
            GlobalConfig.ATTRIBUTES_NAMES.MAX_HEALTH_ATTRIBUTE_NAME) as number
        if(!value) 
            error(`Not found ${GlobalConfig.ATTRIBUTES_NAMES.MAX_HEALTH_ATTRIBUTE_NAME}
                attribute for entity: ${this.model}`)
        return value
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
        this.healthStat = new RegenebleStat(this.GetHealthMaxValue()).EnableRegen()
        CollectionService.AddTag(this.model, GlobalConfig.TAGS.ENTITY)
        this.Events.ChangeHealth.Event.Connect((m,v) => print(v))
        this.healthStat.Updated.Event.Connect(v => this.Events.ChangeHealth.Fire(v))
    }
}