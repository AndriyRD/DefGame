import { IPlayerStorage } from "./IPlayerStorage";

export class BasePlayerStorage<K, T> implements IPlayerStorage<K, T> {
    protected readonly items = new Map<K, T>()
    
    AddItem(key: K, item: T){
        if (this.items.has(key)) return {Saccess: false, Storage: this}
        this.items.set(key, item)
        return {Saccess: true, Storage: this}
    }

    RemoveItem(key: K){
        if (!this.items.has(key)) return {Saccess: false, Storage: this}
        table.clear(this.items.get(key) as any)
        return {Saccess: true, Storage: this}
    }

    GetItem(key: K){
        return this.items.get(key)
    }
    
    Unload(): void {
        return warn('Ovveride') ;
    }
    
    constructor(private readonly player: Player){}
}