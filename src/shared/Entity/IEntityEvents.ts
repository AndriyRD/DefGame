export interface IEntityEvents {
    readonly ChangeHealth: BindableEvent<(model: Model, value: number) => void>
    readonly Died: BindableEvent
}