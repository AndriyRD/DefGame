import { Reflection } from "shared/Reflection"

type AssetInstanceType = Animation | Sound

export enum ASSET_INSTANCES {
    Animation = 'Animation',
    Sound = 'Sound'
}

export class AssetInstance{
    static ASSET_URI_PREFIX = 'rbxassetid://'
    static CreateByURI<T extends AssetInstanceType>(uri: string, className: keyof typeof ASSET_INSTANCES){
        const inst = Reflection.ConvertObjectToMap<string>(new Instance(className))
        inst.set(`${className}Id`, uri)
        return inst as any as T
    }

    static CreateByID<T extends AssetInstanceType>(id: string, className: keyof typeof ASSET_INSTANCES){
        return AssetInstance.CreateByURI<T>(AssetInstance.ASSET_URI_PREFIX+id, className)
    }
}