export class Magazine {
    private currentAmmo = 0
    readonly Changed = new Instance('BindableEvent')

    Reload() {
        this.currentAmmo = this.size
        this.Changed.Fire(this.currentAmmo)
    }
    
    GetCurrentAmmo() {
        return this.currentAmmo
    }
    
    Take(){
        this.currentAmmo--
        this.Changed.Fire(this.currentAmmo)
    }

    AddAmmo(value: number){
        this.currentAmmo += value
        this.Changed.Fire(this.currentAmmo)
    }
    
    GetSize(){
        return this.size
    }

    constructor(private readonly size: number){
        this.currentAmmo = size
    }
}