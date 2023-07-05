import { GlobalConfig } from "shared/GlobalConfig";

export class ViewModelLoader {
    static Load(name: string){
        const origin = GlobalConfig.BUILDING_MODEL_STORAGE.WaitForChild(name)
        if (!origin) error(`Not found building-model by name: ${name}`)
        return origin.Clone() as Model
    }
}