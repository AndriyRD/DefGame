type _Factory<T> = (...param: any) => T

export class FactoryMap<K, T> {
    private readonly map = new Map<K, _Factory<T>>

    Set(key: K, item: _Factory<T>){
        print(`[FactoryMap] -> Set item {${key}}`)
        this.map.set(key, item)
        return this
    }

    GetMap(){
        return this.map
    }

    Find(key: K){
        return this.map.get(key)
    }

    constructor(){

    }
}