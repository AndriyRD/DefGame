export class Voiting {
    private readonly data = new Map<string, Array<Player>>

    Vote(plr: Player, mapName: string){
        this.data.get(mapName)!.push(plr)
    }

    GetFavorite(){
        let res = this.mapList[0]
        for (const item of this.data)
            if(item[1].size() > res.size())
                res = item[0]
        return res
    }

    constructor(private readonly mapList: [string]){
        for (const item of mapList)
            this.data.set(item, [])
    }
}