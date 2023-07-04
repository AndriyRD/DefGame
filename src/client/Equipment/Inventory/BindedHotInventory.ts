import { ContextActionService } from "@rbxts/services";
import { EquipmentGlobalConfig } from "shared/Equipment/EquipmentGlobalConfig";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { HotInventory } from "shared/Equipment/Inventory/HotInventory";
import { RemoteProvider } from "shared/RemoteProvider";

export class BindedHotInventory extends HotInventory {
    private readonly bindInventoryData = EquipmentGlobalConfig.GetBindData()

    PushItem(equipment: IWrappedEquipment) {
        const slotIndex = this.GetNewItemIndex()
        const bindData = this.bindInventoryData[slotIndex]

        ContextActionService.BindAction(bindData.Action, (name, state) => {
            if (name === bindData.Action && state === Enum.UserInputState.Begin){
                this.SelectByKey(equipment.GetID())
            }
        }, false, bindData.Input)
        return super.PushItem(equipment)
    }

    SelectByKey(key: string) {
        super.SelectByKey(key)
        RemoteProvider.GetForEquipment().Select.FireServer(key)
    }
}