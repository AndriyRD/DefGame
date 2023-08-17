import { IBaseProduct } from "./IBaseProduct"

const PRODUCT_LIST = {
    Weapons: new Array<IBaseProduct>,
    Buildings: new Array<IBaseProduct>
}

PRODUCT_LIST.Weapons.push({
    ID: 'AK47',
    Icon: '',
    Price: 150
})

PRODUCT_LIST.Buildings.push({
    ID: 'BaseWall',
    Icon: '',
    Price: 80
})

PRODUCT_LIST.Buildings.push({
    ID: 'MachineGun',
    Icon: '',
    Price: 80
})

export = PRODUCT_LIST