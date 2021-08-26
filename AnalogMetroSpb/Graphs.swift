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
    var tempA = 0
    var tempB = 0
    var tempC = 0
    var tempD = 0
    var tempE = 0
    var tempF = 0
    var tempG = 0
    var tempH = 0
    var tempArr = [Int]()
    var sortedTempArr = [Int]()
    var winnerTempEdge : Edge<Station> = Edge(source: Vertex(data: Station(id: 0, name: ""), isVisited: false), destination: Vertex(data: Station(id: 0, name: ""), isVisited: false), weight: 0)
    
    for (vertexes,edges) in graph.adjacencies where vertexes.isVisited == false {
        
        for edge in edges {
            
            var firstVertex = edge.source
            var nextVertex = edge.destination
            
            switch edge.weight {
            case 0:
                tempA = edge.weight
                tempArr.append(tempA)
            case 1:
                tempB = edge.weight
                tempArr.append(tempB)
            case 2:
                tempC = edge.weight
                tempArr.append(tempC)
            case 3:
                tempD = edge.weight
                tempArr.append(tempD)
            case 4:
                tempE = edge.weight
                tempArr.append(tempE)
            case 5:
                tempF = edge.weight
                tempArr.append(tempF)
            case 6:
                tempG = edge.weight
                tempArr.append(tempG)
            case 7:
                tempH = edge.weight
                tempArr.append(tempH)
            default:
                break
            }
            sortedTempArr = tempArr.sorted(by: <)
            if let integer = sortedTempArr.first {
                winnerTempEdge = Edge(source: firstVertex, destination: nextVertex, weight: integer)
                firstVertex.isVisited = true
                nextVertex.isVisited = true
                shortestPath.append(firstVertex)
                shortestPath.append(nextVertex)
            }
            if winnerTempEdge.destination == to {
                shortestPath.append(to)
                break
            }
        }
    }
    return shortestPath
}







