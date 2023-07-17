export class VectorUtility {
    static random = new Random(tick())
    static CreateVectorByAxis(getAxis: () => number){
        return new Vector3(
            getAxis(),
            getAxis(),
            getAxis())
    }

    static CreateRandomVector(min: number, max: number){
        const getAxis = () => this.random.NextNumber(min, max)
        return this.CreateVectorByAxis(() => getAxis())
    }
}