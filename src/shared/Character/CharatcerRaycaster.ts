import { CHARACTER_LOAD_EVENT_NAMES, ReloadableCharacter } from "./ReloadableCharacter"

export class CharatcerRaycaster {
    protected readonly rayParams = new RaycastParams()
    protected root: BasePart

    constructor(private readonly charcter: ReloadableCharacter, ignoreList: Array<Instance> | undefined){
        this.rayParams.FilterType = Enum.RaycastFilterType.Exclude
        this.rayParams.FilterDescendantsInstances = [this.charcter.GetCharacter()]
        this.root = this.charcter.GetRoot()

        this.charcter.Events.get(CHARACTER_LOAD_EVENT_NAMES.ROOT)?.Event.Connect((root: BasePart)=>{
            this.root = root
            let ignore = ignoreList ? ignoreList : new Array<Instance>();
            this.rayParams.FilterDescendantsInstances = [this.charcter.GetCharacter(), ...ignore]
        })
    }
}