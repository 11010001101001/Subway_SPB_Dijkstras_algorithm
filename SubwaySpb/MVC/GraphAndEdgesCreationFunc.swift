import Foundation

extension BezierCurves {
    /// "union" func for all stuff
    func createGraph() {
        /// adding vertexes and edges for blue line
        addVertexesAndEdgesToGraph(arrStations: blueStationsArr, arrWeights: weightStoreBlueLine)
        /// adding vertexes and edges for red line
        addVertexesAndEdgesToGraph(arrStations: redStationsArr, arrWeights: weightStoreRedLine)
        /// adding vertexes and edges for purple line
        addVertexesAndEdgesToGraph(arrStations: purpleStationsArr, arrWeights: weightStorePurpleLine)
        /// adding vertexes and edges for green line
        addVertexesAndEdgesToGraph(arrStations: greenStationsArr, arrWeights: weightStoreGreenLine)
        /// adding vertexes and edges for orange line
        addVertexesAndEdgesToGraph(arrStations: orangeStationsArr, arrWeights: weightStoreOrangeLine)
        /// adding stations connections 
        addTransitionWays()
    }
}
