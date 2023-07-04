import { CHARACTER_ANIMATIONS_NAMES } from "./CHARACTER_ANIMATIONS_NAMES";
import { ICharatcerAnimationIDSet } from "./ICharatcerAnimationIDSet";

const addIfExist = (list: Map<string, string>, id: string | undefined, name: string) => {
    if (id)
        list.set(name, id)
}

export = (set: ICharatcerAnimationIDSet) => {
    const list = new Map<string, string>()

    addIfExist(list, set.Run, CHARACTER_ANIMATIONS_NAMES.RUN)
    addIfExist(list, set.Idle, CHARACTER_ANIMATIONS_NAMES.IDLE)
    addIfExist(list, set.Walk, CHARACTER_ANIMATIONS_NAMES.WALK);
    addIfExist(list, set.Jump, CHARACTER_ANIMATIONS_NAMES.JUMP)

    return list
}