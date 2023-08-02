import { CollectionService } from "@rbxts/services";
import { EntityFactory } from "shared/Entity/EntityFactory";
import { IEntity } from "shared/Entity/IEntity";
import { IStorageGetEntityResult } from "./IStorageGetEntityResult";

export class EntityStorage {
    protected readonly entities = new Map<Model, IEntity>
    private readonly connections = {
        addEntity: undefined as any as RBXScriptConnection,
        removeEntity: undefined as any as RBXScriptConnection
    }
    readonly AddedEntity: BindableEvent<(m: Model)=>void> = new Instance('BindableEvent')

    protected IsEntityDescendant(inst: Instance){
        for (const e of this.entities)
            if (inst.IsDescendantOf(e[1].GetModel())) return [true, e[1]]
        return [false, undefined] as [boolean, IEntity | undefined]
    }

    protected IsEntityModel(model: Model){
        return model.HasTag(this.entityTag)
    }

    protected AddEntity(model: Model){
        const entity = EntityFactory.Create(model)
        this.entities.set(model, entity)
        this.AddedEntity.Fire(entity.GetModel())
    }

    private RemoveEntity(model: Model){
        this.entities.delete(model)
    }

    private EnableAutoRegister(){
        this.connections.addEntity = 
            CollectionService.GetInstanceAddedSignal(this.entityTag).Connect((inst) =>
                this.AddEntity(inst as Model)
            )

        this.connections.removeEntity = 
            CollectionService.GetInstanceAddedSignal(this.entityTag).Connect((inst) =>
                this.RemoveEntity(inst as Model)
            )
    }

    private DisableAutoRegister(){
        this.connections.addEntity.Disconnect()
        this.connections.removeEntity.Disconnect()
    }

    GetTagMarker(){
        return this.entityTag
    }

    AddIfIsEntity(models: Array<Model>): EntityStorage{
        for (const item of models)
            if(this.IsEntityModel(item)) this.AddEntity(item)
        return this
    }

    AddFromInstanceChildren(inst: Instance){
        for (const item of inst.GetChildren())
            if(item.IsA("Model") && this.IsEntityModel(item)) this.AddEntity(item)
        return this
    }

    GetEntityByDescendant(inst: Instance): IStorageGetEntityResult{
        const res = this.IsEntityDescendant(inst)
        return {
            Result: res[0] as boolean,
            Entity: res[1] as IEntity
        }
    }

    TryGetByEntityModel(model: Model){
        return this.entities.get(model)
    }

    AutoRegisterMode(enable: boolean){
        if(enable) this.EnableAutoRegister()
        else this.DisableAutoRegister()
        return this
    }

    constructor(protected readonly entityTag: string, startEntitiesModels: [Model] = [] as any){
        for (const entityModel of startEntitiesModels)
            if(this.IsEntityModel(entityModel))
                this.AddEntity(entityModel)
    }
}