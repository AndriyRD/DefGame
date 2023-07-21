export class ArraySpliter {
    private static PopArrayElements<T>(targetArr:[], count: number){
        const newItems = []
        for (const i of $range(0, count-1))
            newItems.push(targetArr.pop())
        return newItems as Array<T>
    }

    static Split<T>(arr: Array<T>, size: number){
        const targetArrCopy = table.clone(arr)
        const containerArr = new Array<Array<T>>
        const containerArrSize = math.floor(arr.size()/size)

        for (const i of $range(0,containerArrSize))
            containerArr.push(ArraySpliter.PopArrayElements(targetArrCopy as [], size))

        print(containerArr.size())
        return containerArr
    }
}