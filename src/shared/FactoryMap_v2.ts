type _Factory<Result, Props> = (props: Props) => Result

export class FactoryMap<Key, Result, Props> {
    private readonly map = new Map<Key, _Factory<Result, Props>>

    Set(key: Key, item: _Factory<Result, Props>){
        this.map.set(key, item)
        return this
    }

    GetMap(){
        return this.map
    }

    Find(key: Key){
        return this.map.get(key)
    }
}