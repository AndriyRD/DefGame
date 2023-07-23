import { IBaseProduct } from "./IBaseProduct"

const PRODUCT_LIST = {
    Weapon: new Array<IBaseProduct>,
    Building: new Array<IBaseProduct>
}

PRODUCT_LIST.Weapon.push({
    ID: 'AK47',
    Icon: '',
    Price: 150
})

PRODUCT_LIST.Building.push({
    ID: 'BaseWall',
    Icon: '',
    Price: 80
})

export = PRODUCT_LIST