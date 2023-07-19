import { ObjectPull } from "./ObjectPull";

export class ChunkedObjectPull<T>{

    GetChunk(chunkSize: number){
        const items = this.objectPull.GetFreeItems()
        let res = []
        for (const freeItem of items) {
            const itemLifeTime = freeItem.GetLifeTime()
            let oldCounter = 0

            for (const currentFreeItem of items) {
                if(itemLifeTime > currentFreeItem.GetLifeTime())
                    oldCounter++
            }

            if(oldCounter >= chunkSize)
                res.push(freeItem)
        }
        if(res.size() > chunkSize) res = res.filter((v, i) => i < chunkSize)
        return res
    }

    GetSize(){
        return this.objectPull.GetSize()
    }

    Push(item: T){
        return this.objectPull.Push(item)
    }

    Take(){
        return this.objectPull.Take()
    }

    constructor(private readonly objectPull: ObjectPull<T>){
    }
}