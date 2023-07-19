import { ObjectPull } from "./ObjectPull";
import { TempItem } from "./TempItem";

export abstract class GeneratedObjectPull<T> extends ObjectPull<T> {
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