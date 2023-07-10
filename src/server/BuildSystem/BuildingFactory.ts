import { ReplicatedStorage } from "@rbxts/services";
const models = ReplicatedStorage.WaitForChild('Build').WaitForChild('Models')

export class BuildingFactory {

    Create(owner: Player, name: string){
        const originModel = models.WaitForChild(name) as Model
        if(!originModel) error(`Not found model for building: ${name}`)

        const building = {

        }
    }
}