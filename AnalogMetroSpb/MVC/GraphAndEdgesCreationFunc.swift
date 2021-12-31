import Foundation



@available(iOS 15.0, *)
extension BezierCurves {
    // MARK: "union" func for all stuff
    func createGraph() {
        // MARK: adding vertexes and edges for blue line
        addVertexesAndEdgesToGraph(arrStations: blueStationsArr, arrWeights: weightStoreBlueLine)
        // MARK: adding vertexes and edges for red line
        addVertexesAndEdgesToGraph(arrStations: redStationsArr, arrWeights: weightStoreRedLine)
        // MARK: adding vertexes and edges for purple line
        addVertexesAndEdgesToGraph(arrStations: purpleStationsArr, arrWeights: weightStorePurpleLine)
        // MARK: adding vertexes and edges for green line
        addVertexesAndEdgesToGraph(arrStations: greenStationsArr, arrWeights: weightStoreGreenLine)
        // MARK: adding vertexes and edges for orange line
        addVertexesAndEdgesToGraph(arrStations: orangeStationsArr, arrWeights: weightStoreOrangeLine)
        // MARK: adding stations connections 
        addTransitionWays()
    }
}
