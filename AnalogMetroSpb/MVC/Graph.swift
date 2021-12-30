import Foundation
import UIKit


protocol Graph {
    associatedtype Element
    func add(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Int)
}

@available(iOS 15.0, *)
final class AdjacencyList <T:Hashable>: Graph {
    
    var adjacencies: [Vertex<Station>:[Edge<Station>]] = [:]
    var pathDict: [Vertex<Station>: Vertex<Station>] = [:]
    var path: [Vertex<Station>] = []
    var bigStationsArrIds: Set<Int> = []
    var info: [Int: String] = [:]
    var distancies: [Vertex<Station>: Int] = [:]
    var distanciesCopy: [Vertex<Station>: Int] = [:]
    var detailsInfoArr = [String]()
    
    init() {}
    
    func add(from source:Vertex<Station>, to destination: Vertex<Station>, weight: Int) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        var arr: [Edge<Station>] = []
        arr.append(edge)
        if adjacencies.keys.contains(source) {
            adjacencies[source]?.append(edge)
        } else {
            adjacencies[source] = arr
        }
    }
}
