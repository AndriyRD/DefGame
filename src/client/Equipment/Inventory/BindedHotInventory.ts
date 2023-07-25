import { CollectionService, ContextActionService } from "@rbxts/services";
import { EventProvider } from "client/EventProvider";
import { EquipmentGlobalConfig } from "shared/Equipment/EquipmentGlobalConfig";
import { IWrappedEquipment } from "shared/Equipment/IWrappedEquipment";
import { HotInventory } from "shared/Equipment/Inventory/HotInventory";
import { GlobalConfig } from "shared/GlobalConfig";
import { RemoteProvider } from "shared/RemoteProvider";

export class BindedHotInventory extends HotInventory {
    private selectedItem: string | undefined = undefined
    private readonly bindInventoryData = EquipmentGlobalConfig.GetBindData()

    private CanEquip(){
        return !CollectionService.HasTag(this.owner, GlobalConfig.RUN_STATE_TAG_NAME)
    }

    private OnRun(){
        if(this.CurrentCell){
            this.selectedItem = this.CurrentCell.Equipment.GetID()
            this.SelectEmpty()
        }
    }

    private OnStopRun(){
        if(this.selectedItem){
            this.SelectByKey(this.selectedItem)
            this.selectedItem = undefined
        }
    }

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
        if(!this.CanEquip()) return
        super.SelectByKey(key)
        RemoteProvider.GetForEquipment().Select.FireServer(key)
    }

    SelectEmpty(): void {
        if(this.CurrentCell){
            RemoteProvider.GetForEquipment().Select.FireServer(this.CurrentCell.Equipment.GetID())
            super.SelectEmpty()
        }
    }

    constructor(owner: Player, size: number){
        EventProvider.Runner.Run.Event.Connect(() => this.OnRun())
        EventProvider.Runner.Stop.Event.Connect(() => this.OnStopRun())
        super(owner, size)
    }
}