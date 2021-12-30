import Foundation



@available(iOS 15.0, *)
extension BezierCurves {
    // MARK: объединяем все графы и ребра в единый граф вместе с переходами
    func createGraph() {
        // MARK: добавляем вершины графа и ребра между ними для синей ветки
        addVertexesAndEdgesToGraph(arrStations: blueStationsArr, arrWeights: weightStoreBlueLine)
        // MARK: добавляем вершины графа и ребра между ними для красной ветки
        addVertexesAndEdgesToGraph(arrStations: redStationsArr, arrWeights: weightStoreRedLine)
        // MARK: добавляем вершины графа и ребра между ними для фиолетовой ветки
        addVertexesAndEdgesToGraph(arrStations: purpleStationsArr, arrWeights: weightStorePurpleLine)
        // MARK: добавляем вершины графа и ребра между ними для зеленой ветки
        addVertexesAndEdgesToGraph(arrStations: greenStationsArr, arrWeights: weightStoreGreenLine)
        // MARK: добавляем вершины графа и ребра между ними для оранжевой ветки
        addVertexesAndEdgesToGraph(arrStations: orangeStationsArr, arrWeights: weightStoreOrangeLine)
        // MARK: добавляем переходы для каждой вершины прямым вызовом метода
        addTransitionWays()
    }
}
