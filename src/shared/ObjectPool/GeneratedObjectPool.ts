import { ObjectPool } from "./ObjectPool";
import { TempItem } from "./TempItem";

export abstract class GeneratedObjectPool<T> extends ObjectPool<T> {
    protected abstract CreateItem(): TempItem<T>

    Take() {
        let res = super.Take()
        if(!res) {
            res = this.CreateItem()
            this.items.push(res)
        }
        return res
    }
}