import { CollectionService } from "@rbxts/services";
import { EntityFactory } from "shared/Entity/EntityFactory";
import { IEntity } from "shared/Entity/IEntity";

export class EntityStorage {
    private readonly entities = new Map<Model, IEntity>
    private readonly connections = {
        addEntity: undefined as any as RBXScriptConnection,
        removeEntity: undefined as any as RBXScriptConnection
    }

    private IsEntityModel(model: Model){
        return model.HasTag(this.entityTag)
    }

    private OnAddEntity(inst: Instance){
        if(inst.IsA("Model"))
            this.entities.set(inst, EntityFactory.Create(inst))
    }

    private OnRemoveEntity(inst: Instance){
        if(inst.IsA("Model"))
            this.entities.delete(inst)
    }

    private EnableAutoRegister(){
        this.connections.addEntity = 
            CollectionService.GetInstanceAddedSignal(this.entityTag).Connect((inst) =>
                this.OnAddEntity(inst)
            )

        this.connections.removeEntity = 
            CollectionService.GetInstanceAddedSignal(this.entityTag).Connect((inst) =>
                this.OnRemoveEntity(inst)
            )
    }

    private DisableAutoRegister(){
        this.connections.addEntity.Disconnect()
        this.connections.removeEntity.Disconnect()
    }

    TryGetEntity(model: Model){
        return this.entities.get(model)
    }

    AutoRegisterMode(enable: boolean){
        if(enable) this.EnableAutoRegister()
        else this.DisableAutoRegister()
        return this
    }

    constructor(private readonly entityTag: string, startEntitiesModels: [Model] = [] as any){
        for (const entityModel of startEntitiesModels)
            if(this.IsEntityModel(entityModel))
                this.OnAddEntity(entityModel)
    }
}