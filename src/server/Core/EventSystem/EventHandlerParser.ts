import { Reflection } from "shared/Reflection";
import { IEventListener } from "./IEventListener";

export type EventHandler = {
    readonly Name: string,
    Handle: (...params: any) => any
}

export class EventHandlerParser {
    private readonly HANDLER_PREFIX = 'On'

    private IsHandlerName(name: string): string | undefined{
        return string.find(name, `${this.HANDLER_PREFIX}([A-z]*)`)[2] as string | undefined
    }

    Parse(eventListener: IEventListener){
        const res = [] as Array<EventHandler>
        for (const propItem of Reflection.ConvertObjectToMap(eventListener)) {
            if(typeOf(propItem[1]) === 'function'){
                const handlerName = this.IsHandlerName(propItem[0])
                if(handlerName)
                    res.push({
                        Name: handlerName,
                        Handle: propItem[1] as any
                    })
            }
        }
        return res
    }
}