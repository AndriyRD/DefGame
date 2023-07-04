import { IPlayerStorageBaseOperationStatus } from "./IPlayerStorageBaseOperationStatus"
import { IStorage } from "./IStorage"

export interface IPlayerStorage<K, T> extends IStorage{
    AddItem(key: K, item: T): IPlayerStorageBaseOperationStatus<K, T>
    RemoveItem(key: K): IPlayerStorageBaseOperationStatus<K, T>
}