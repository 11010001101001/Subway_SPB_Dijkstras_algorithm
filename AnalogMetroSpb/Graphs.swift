import UIKit



struct Station : Hashable {
    var id : Int 
    var name : String
}

struct Vertex<T> { // вершины графа - станции
    let data : T
}

struct Edge<T> { // ребра графа - ж/д пути
    let source : Vertex<T>  // станция от которой берет начало путь
    let destination : Vertex<T>  // станция к которой прибудем
    let weight : Int
}

extension Vertex : Hashable where T : Hashable {}
extension Vertex : Equatable where T : Equatable {}
extension Vertex : CustomStringConvertible {
    var description : String {
        return "\(data)"
    }
    
}

protocol Graph {
    associatedtype Element
    func createVertex(data: Element) -> Vertex<Element>
    func add(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Int)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
}

class AdjacencyList <T:Hashable>: Graph {
    
    private var adjacencies : [Vertex<T>:[Edge<T>]] = [:] // массив узлов в формате словаря Вершина : массив ребер ей соответствующих
    init() {}
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    func add(from source:Vertex<T>, to destination: Vertex<T>, weight: Int) {
        
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
}

extension AdjacencyList: CustomStringConvertible { // визуализация списка смежности в котором хранится граф с его вершинами и ребрами
    public var description: String {
        var result = ""
        for (vertex,edges) in adjacencies {
            var edgeString = ""
            for (index,edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [\(edgeString)]\n")
        }
        return result
    }
}

let graph = AdjacencyList<Station>()  // это граф

// АЛГОРИТМ ДЕЙКСТРЫ 

//extension Graphable {
//    public func route(to destination: Vertex<Element>, in tree: [Vertex<Element> : Visit<Element>]) -> [Edge<Element>] { // 1
//
//      var vertex = destination // 2
//      var path : [Edge<Element>] = [] // 3
//
//      while let visit = tree[vertex],
//        case .edge(let edge) = visit { // 4
//
//        path = [edge] + path
//        vertex = edge.source // 5
//      }
//      return path // 6
//    }
//    public func distance(to destination: Vertex<Element>, in tree: [Vertex<Element> : Visit<Element>]) -> Double { // 1
//      let path = route(to: destination, in: tree) // 2
//      let distances = path.flatMap{ $0.weight } // 3
//      return distances.reduce(0.0, { $0 + $1 }) // 4
//    }
//    public func dijkstra(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
//        var visits : [Vertex<Element> : Visit<Element>] = [source: .source]
//        var priorityQueue = PriorityQueue<Vertex<Element>>(sort: { self.distance(to: $0, in: visits) < self.distance(to: $1, in: visits) })
//        priorityQueue.enqueue(source)
//        while let visitedVertex = priorityQueue.dequeue() { // 1
//          if visitedVertex == destination { // 2
//            return route(to: destination, in: visits) // 3
//          }
//            let neighbourEdges = edges(from: visitedVertex) ?? [] // 1
//            for edge in neighbourEdges { // 2
//              if let weight = edge.weight { // 3
//                if visits[edge.destination] != nil { // 1
//                  if distance(to: visitedVertex, in: visits) + weight < distance(to: edge.destination, in: visits) { // 2
//                    visits[edge.destination] = .edge(edge) // 3
//                    priorityQueue.enqueue(edge.destination) // 4
//                  }
//                } else { // 1
//                  visits[edge.destination] = .edge(edge) // 3
//                  priorityQueue.enqueue(edge.destination) // 4
//                }              }
//            }
//        }
//      return nil
//    }
//}
//
//public enum Visit<Element>: Hashable {
//    case source
//    case edge(Edge<Element>)
//}

