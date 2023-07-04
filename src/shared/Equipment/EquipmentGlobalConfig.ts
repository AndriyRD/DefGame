export type BindInventorySlotData = {
    Action: string,
    Input: Enum.KeyCode | Enum.UserInputType
}

export class EquipmentGlobalConfig {
    static WEAPON_GRIP_NAME_POSTFIX = 'Grip'
    static HOT_INVENTORY_SIZE = 3
    static GetBindData(){
        const dataList = new Array<BindInventorySlotData>()
        
        dataList.push({
            Action: 'OneSlotAction',
            Input: Enum.KeyCode.One
        })

        dataList.push({
            Action: 'TwoSlotAction',
            Input: Enum.KeyCode.Two
        })

        dataList.push({
            Action: 'ThreeSlotAction',
            Input: Enum.KeyCode.Three
        })

        return dataList
    }
}