import { EntityStorage } from "./EntityStorage";

export class EntityStorageUnpacked {
    protected UnpackEntityModel(model: Model){
        model.GetDescendants().forEach((item) => {
            if(item.IsA("BasePart")) item.Parent = model
        })
        print(`Added new entity: ${model}`)
    }
    
    GetEntityByDescendant(inst: Instance){
        const entityModel = inst.Parent as Model
        if(entityModel)
            if(entityModel.HasTag(this.storage.GetTagMarker()))
                return {
                    Result: true,
                    Entity: this.storage.TryGetByEntityModel(entityModel)!
                }

        return {
            Result: false,
            Entity: undefined
        }
    }

    constructor(protected readonly storage: EntityStorage){
        storage.AddedEntity.Event.Connect((m) => this.UnpackEntityModel(m))
    }
}