type _Factory<Result, Props> = (props: Props) => Result

export class FactoryMap<K, T, U> {
    private readonly map = new Map<K, _Factory<T, U>>

    Set(key: K, item: _Factory<T, U>){
        this.map.set(key, item)
        return this
    }

    GetMap(){
        return this.map
    }

    Find(key: K){
        return this.map.get(key)
    }
}