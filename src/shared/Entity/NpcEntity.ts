import { HumanoidEntity } from "./HumanoidEntity";

export class NpcEntity extends HumanoidEntity {
    protected OnDied(): void {
        super.OnDied()
        this.Dispose()
    }
}