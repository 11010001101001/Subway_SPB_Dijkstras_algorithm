import UIKit



struct Station : Hashable {
    var id : Int 
    var name : String
}

struct Vertex<T> { // вершины графа - станции
    let data : T
    var visited = false
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
        let vertex = Vertex(data: data, visited: false)
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

// Алгоритм Дейкстры

func findPath(from: Vertex<Station>, to: Vertex<Station>) -> [Vertex<Station>] {
    
    var shortestPath : [Vertex<Station>] = []
    var tempV = Vertex(data: Station(id: 0, name: ""))
    var tempV2 = Vertex(data: Station(id: 0, name: ""))
    
    for (vertex,edges) in graph.adjacencies {
        
        if vertex == from {
            shortestPath.append(vertex)
            var temp = vertex
            temp.visited = true
            
            for (index,edge) in edges.enumerated() where edge.source == vertex {
                
                var tempDict : [Int:Vertex<Station>] = [:]
                
                switch index {
                case 0:
                    tempDict.updateValue(edge.destination, forKey: edge.weight)
                case 1:
                    tempDict.updateValue(edge.destination, forKey: edge.weight)
                case 2:
                    tempDict.updateValue(edge.destination, forKey: edge.weight)
                case 3:
                    tempDict.updateValue(edge.destination, forKey: edge.weight)
                default : break
                }
                print("Длины, ребра и их конечные вершины: \(tempDict)")
                let sortedDict = tempDict.sorted(by: {$0.key < $1.key })
                if let unwrapped = sortedDict.first?.value {
                    tempV = unwrapped
                }
                tempV.visited = true
                shortestPath.append(tempV)
                print("Конец ребра с кратчайшей длинной в вершине: \(tempV)")
            }
        }
        repeat {
            for (vertex,edges) in graph.adjacencies {
                
                if vertex == tempV {
                    tempV.visited = true
                    shortestPath.append(tempV)
                    
                    for (index,edge) in edges.enumerated() where edge.source == vertex {
                        
                        var tempDict : [Int:Vertex<Station>] = [:]
                        
                        switch index {
                        case 0:
                            tempDict.updateValue(edge.destination, forKey: edge.weight)
                        case 1:
                            tempDict.updateValue(edge.destination, forKey: edge.weight)
                        case 2:
                            tempDict.updateValue(edge.destination, forKey: edge.weight)
                        case 3:
                            tempDict.updateValue(edge.destination, forKey: edge.weight)
                        default : break
                        }
                        let sortedDict = tempDict.sorted(by: {$0.key < $1.key })
                        if let unwrapped = sortedDict.first?.value {
                            tempV2 = unwrapped
                        }
                        tempV2.visited = true
                        shortestPath.append(tempV2)
                    }
                }
            }
        } while tempV2 == to
    }
    return shortestPath
}
