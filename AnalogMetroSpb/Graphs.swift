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

var allVertexes : [(Vertex<Station>,[Edge<Station>])] = [] // массив всех вершин графа в виде массива кортежей

func fillAllVertexes() {
    for (key,value) in graph.adjacencies {
        allVertexes.insert((key, value), at: 0)
    }
}


func findPath(from: Int, to: Int) -> [Int] {
    var distances = Array(repeating: 1000000, count: allVertexes.count) // массив кратчайших расстояний до точки старта от всех вершин графа
    distances[from] = 0
    var parent = Array(repeating: -1, count: allVertexes.count) // массив пути
    
    for _ in 0...allVertexes.count {
        
        var best = -1
        
        for index in 0..<allVertexes.count-1 { // цикл который ищет лучшую вершину по расстоянию
            
            if allVertexes[index].0.visited == false && (best == -1 || distances[index] < distances[best]) {
                best = index // в best получили индекс вершины с наименьшим расстоянием
            }
        }
        
        allVertexes[best].0.visited = true
        
        for edge in allVertexes[best].1 { // цикл по ребрам найденной вершины
            let k = edge.destination.data.id
            let w = edge.weight
            
            if distances[k] < distances[best] + w { // обновляем массив пути parent только если улучшили дистанцию, для конкретной вершины k устанавливаем родителя best ; также проверим, что новая дистанция меньше старой и в таком случае обновим дистанцию и родителя для вершины k.
                distances[k] = distances[best]+w
                parent[k] = best
            }
        }
    }
    return parent
}


