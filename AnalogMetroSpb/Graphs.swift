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

// Алгоритм Дейкстры

let graph = AdjacencyList<Station>()  // это граф

var shortestPathsArrayFromAllVerticiesToStart = [Int]() // массив длин кратчайших путей вершин графа до стартовой вершины
// изначально все вершины не помечены / кратчайший путь в стартовой вершине равен 0 а для всех остальных вершин - бесконечности или оч большому числу
var arrayOfParents = [Vertex<Station>]() // массив предков


func findPath(from: Vertex<Station>, to: Vertex<Station>) -> [Vertex<Station>] {
    
    for (vertex,edges) in graph.adjacencies {
        var tempValue = vertex
        tempValue.visited = true  // говорим что стартовая вершина помечена
        for edge in edges {
            if edge.source == vertex {  // далее просматриваем все ребра исходящие из стартовой вершины и записываем их в словарь формата [вес ребра : edge.destination]
                arrayOfParents.append(vertex) // в массив предков добавляем стартовую вершину
                var weightArrayDict : [Int:Vertex<Station>] = [:]
                weightArrayDict.updateValue(vertex, forKey: edge.weight)
                var sortedDict = weightArrayDict.sorted(by: {$0.key < $1.key}) // сортируем словарь так чтобы первый ключ - а это вес ребра был минимальный
                var tempValue = edge.destination
                tempValue = sortedDict.first?.value ?? vertex // говорим что edge.destination у этого ребра с минимальным весом - tempValue
                tempValue.visited = true // помечаем эту вершину как помеченную
            }
        }
    }
    return shortestPathsArrayFromAllVerticiesToStart
}
