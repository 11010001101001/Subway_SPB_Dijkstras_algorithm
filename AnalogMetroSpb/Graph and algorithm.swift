import UIKit



struct Station : Hashable {
    var id : Int
    var name : String
}

struct Vertex { // вершины графа - станции
    var data : Int
    var visited : Bool = false
}


struct Edge { // ребра графа - ж/д пути
    let source : Int  // станция от которой берет начало путь
    let destination : Int  // станция к которой прибудем
    let weight : Int
}

extension Vertex : Hashable{}
extension Vertex : Equatable{}
extension Vertex : CustomStringConvertible {
    var description : String {
        return "\(data)"
    }
    
}

protocol Graph {

    func createVertex(data: Int) -> Vertex
    func add(from source: Vertex, to destination: Vertex, weight: Int)
}

class AdjacencyList : Graph {
    
    var adjacencies : [Vertex:[Edge]] = [:] //  словарь где ключ - индекс вершины, а значение - массив ребер или ребро у которого ( рых ) есть weight
    init() {}
    
    func createVertex(data: Int) -> Vertex {
        let vertex = Vertex(data: data, visited: false)
        adjacencies[vertex] = []
        return vertex
    }
    
    func add(from source:Vertex, to destination: Vertex, weight: Int) {
        let edge = Edge(source: source.data, destination: destination.data, weight: weight)
        adjacencies[source]?.append(edge)
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

let graph = AdjacencyList()  // это граф

var allVertexes : [(Vertex,[Edge])] = [] // массив всех вершин графа в виде массива кортежей

func fillAllVertexes() {
    for (key,value) in graph.adjacencies {
        allVertexes.insert((key, value), at: 0)
    }
}

var parent = Array(repeating: -1, count: allVertexes.count) // массив пути Наш массив parent будет показывать для каждой вершины, из какой вершины нам выгоднее всего сюда приходить, чтобы путь до сюда от начальной вершины был минимальным.Тогда для любой вершины нам нужно распутывать этот массив. Каждый раз переходить в «самого выгодного родителя».А у начальной вершины родитель -1.

func Deikstra(from: Int, to: Int) -> [Int] {
    var distances = Array(repeating: 1000000, count: allVertexes.count) // массив кратчайших расстояний до точки старта от всех вершин графа
    distances[from] = 0
    
    for _ in 0...allVertexes.count { // цикл по кол-ву итераций
        
        var best = -1
        
        for index in 0..<allVertexes.count - 1 { // цикл который ищет лучшую вершину по расстоянию
            
            if allVertexes[index].0.visited == false && (best == -1 || distances[index] < distances[best]) {
                best = index // в best получили индекс вершины с наименьшим расстоянием
            }
        }
        
        allVertexes[best].0.visited = true
        
        for edge in allVertexes[best].1 { // цикл по ребрам найденной вершины
            let k = edge.destination
            let w = edge.weight
            
            if distances[k] < distances[best] + w { // обновляем массив пути parent только если улучшили дистанцию, для конкретной вершины k устанавливаем родителя best ; также проверим, что новая дистанция меньше старой и в таком случае обновим дистанцию и родителя для вершины k.
                distances[k] = distances[best]+w
                parent[k] = best
            }
        }
    }
    return parent
}

var shortestWay = [Int]()

func findPath(from: Int, to: Int) -> [Int] {
    
    var v = from // Положим в вершину (некоторую переменную v) сначала from.
    
    while parent[v] != -1 { // Потом запустим while (пока парент не равен -1).
        
        shortestWay.append(v) // Будем в путь добавлять эту вершину v.
        
        v = parent[v] // А потом в v класть ее родителя.
    }
    return shortestWay
}


func DeikstraAlgorithm(from: Int, to: Int) {
    print(Deikstra(from: from, to: to))
    print(findPath(from: from, to: to))
}


