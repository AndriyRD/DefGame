import { AccountOption } from "./AccountOption";

export class Account {
    private sum;

    GetOwner(){
        return this.owner
    }

    Add(count: number){
        const endSum = this.sum + count
        const maxSize = this.option.MaxSize

        if (endSum > maxSize)
            this.sum = maxSize
        else
            this.sum += endSum
        return this
    }

    CanSub(count: number){
        return this.sum >= count
    }

    Sub(count: number){
        const endSum = this.sum - count
        if (endSum < 0 && !this.option.CanNegetive)
            this.sum = 0
        else
            this.sum -= endSum
    }

    Save(){
        //TODO: Save to DB
    }

    constructor(
        private readonly owner: Player,
        private readonly option: AccountOption){
            this.sum = option.StartSum
        }
}