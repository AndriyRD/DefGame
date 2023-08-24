import { Reflection } from "shared/Reflection"

export class Configuration<T extends object> {
    private readonly items: Map<string, T>

    Get<U extends T>(key: string): U{
        return this.items.get(key) as U
    }

    constructor(items: object & any){
        this.items = Reflection.ConvertObjectToMap<T>(items)
    }
}