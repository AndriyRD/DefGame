export interface IHitEffect {
    Hit(pos: Vector3, material: Enum.Material): void
    GetMaterials(): Array<Enum.Material>
}