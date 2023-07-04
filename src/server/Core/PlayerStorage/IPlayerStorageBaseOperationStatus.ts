import { BasePlayerStorage } from "./BasePlayerStorage";

export interface IPlayerStorageBaseOperationStatus<K, T> {
    Storage: BasePlayerStorage<K, T>,
    Saccess: boolean
}