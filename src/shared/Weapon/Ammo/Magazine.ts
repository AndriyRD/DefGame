export class Magazine {
    private currentAmmo = 0

    Reload() {
        this.currentAmmo = this.size
    }
    
    GetCurrentAmmo() {
        return this.currentAmmo
    }
    
    Take(){
        this.currentAmmo--
    }

    AddAmmo(value: number){
        this.currentAmmo += value
    }
    
    GetSize(){
        return this.size
    }

    constructor(private readonly size: number){
        this.currentAmmo = size
    }
}