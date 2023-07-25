export class Reflection {
    static ConvertObjectToMap<T>(obj: object){
        return obj as any as Map<string, T>
    }
}