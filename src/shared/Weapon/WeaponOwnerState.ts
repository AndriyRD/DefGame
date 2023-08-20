export class WeaponOwnerState {
    private owner: Player | undefined
    ChangeOwnerEvent: BindableEvent<(oldOwner: Player|undefined, newOwner: Player|undefined) => void > = 
        new Instance('BindableEvent')

    ChagneOwner(newOwner: Player){
        if(!this.owner){
            this.owner = newOwner
            this.ChangeOwnerEvent.Fire(undefined, newOwner)
        }
        return this
    }

    RemoveOwner(){
        this.ChangeOwnerEvent.Fire(this.owner, undefined) 
        this.owner = undefined
        return this
    }

    GetCurrent(){
        return this.owner
    }
}