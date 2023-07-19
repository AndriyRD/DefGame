import { IBaseProduct } from "./IBaseProduct"

const PRODUCT_LIST = {
    Weapon: new Array<IBaseProduct>
}

PRODUCT_LIST.Weapon.push({
    ID: 'AK47',
    Icon: '',
    Price: 150
})

export = PRODUCT_LIST