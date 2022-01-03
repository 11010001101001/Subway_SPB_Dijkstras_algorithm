import UIKit



struct Station : Hashable {
    var id : Int 
    var name : String
}

struct Vertex<T> {
    let data: T
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



struct Singleton {
    
    static let vc = ViewController()
    // MARK: graph
    static let graph = AdjacencyList<Station>()
    // MARK: all vertexes array
    static let map = BezierCurves()
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

