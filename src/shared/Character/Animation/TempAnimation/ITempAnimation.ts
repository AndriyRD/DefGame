export interface ITempAnimation {
    CanBreak(): boolean
    ContinueTrack(): ITempAnimation
    Break(): void
}