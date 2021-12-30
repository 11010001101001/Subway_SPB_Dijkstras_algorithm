import UIKit



struct Station : Hashable {
    var id : Int 
    var name : String
}

struct Vertex<T> {
    let data: T
    var visited: Bool? = false 
}

struct Edge<T> {
    var source : Vertex<T>
    var destination : Vertex<T>
    let weight : Int
}

extension Vertex : Hashable where T : Hashable {}
extension Vertex : Equatable where T : Equatable {}
extension Vertex : CustomStringConvertible {
    var description : String {
        return "\(data)"
    }
}


@available(iOS 15.0, *)
struct Singleton {
    
    static let vc = ViewController()
    // MARK: граф
    static let graph = AdjacencyList<Station>()
    // MARK: все вершины
    static var allVertexes: [Vertex<Station>] = []
    static var pathWay: [Int] = [] { 
        didSet {
            print("Строим путь для:\(pathWay)")
            if pathWay.count > 2 {
                pathWay.removeAll()
                graph.path.removeAll()
            } 
        }
    }
}

