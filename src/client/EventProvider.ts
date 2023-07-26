export class EventProvider {
    static readonly Runner = {
        Run: new Instance('BindableEvent'),
        Stop: new Instance('BindableEvent')
    }

    static readonly CharatcerController = {
        Camera: {
            Enable: new Instance('BindableEvent'),
            Disable: new Instance('BindableEvent')
        },

        Rotation: {
            Enable: new Instance('BindableEvent'),
            Disable: new Instance('BindableEvent')
        }
    }

    static readonly Build = {
        PreviewMode: new Instance('BindableEvent')
    }

    static readonly Weapon = {
        Equip: new Instance('BindableEvent'),
        Unequip: new Instance('BindableEvent')
    }
}