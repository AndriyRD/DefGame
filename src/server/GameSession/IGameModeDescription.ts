export interface IGameModeDescription {
    TeamOptions: {
        FriendlyFire: boolean
    } | undefined

    ProductOptions: {
        EquipmentProductOptions: {
            ItemList: [{ID: string, Price: number}]
            FilterType: Enum.RaycastFilterType
        }
    } | undefined

    MapIDList: [string]
}