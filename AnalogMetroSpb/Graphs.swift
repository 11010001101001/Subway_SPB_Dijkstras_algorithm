import UIKit



struct Station : Hashable {
    var id : Int 
    var name : String
}

struct Vertex<T> { // вершины графа - станции
    let data : T
    var isVisited : Bool
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
    
    var adjacencies : [Vertex<T>:[Edge<T>]] = [:] //  словарь где ключ - вершина а значение - массив ребер или ребро у которого ( рых ) есть weight
    init() {}
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, isVisited: false)
        adjacencies[vertex] = []
        return vertex
    }
    
    func add(from source:Vertex<T>, to destination: Vertex<T>, weight: Int) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
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

//Алгоритм Дейкстры

func findPath(from: Vertex<Station>, to: Vertex<Station>) -> [Vertex<Station>] {
    
    var shortestPath : [Vertex<Station>] = [] //кратчайший путь
    var tempStatus : Bool = false
    tempStatus = from.isVisited
    tempStatus = true
    shortestPath.append(from)
    
    for (vertexes,edges) in graph.adjacencies {
        
        for edge in edges {
            
            var tempVertex1 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var tempVertex2 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var tempVertex3 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var tempVertex4 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var tempVertex5 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var tempVertex6 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var tempVertex7 : Vertex<Station> = Vertex(data: Station(id: 0, name: ""), isVisited: false)
            var weight1 = 0
            var weight2 = 0
            var weight3 = 0
            var weight4 = 0
            var weight5 = 0
            var weight6 = 0
            var weight7 = 0
            
            
            switch edge.weight {
            case 0:
                weight1 = edge.weight
                tempVertex1.isVisited = true
            case 1:
                weight2 = edge.weight
                tempVertex2.isVisited = true
            case 2:
                weight3 = edge.weight
                tempVertex3.isVisited = true
            case 3:
                weight4 = edge.weight
                tempVertex4.isVisited = true
            case 4:
                weight5 = edge.weight
                tempVertex5.isVisited = true
            case 5:
                weight6 = edge.weight
                tempVertex6.isVisited = true
            case 6:
                weight7 = edge.weight
                tempVertex7.isVisited = true
            default:
                break
            }
            if edge.destination
        }
        
    }
    return shortestPath
}





