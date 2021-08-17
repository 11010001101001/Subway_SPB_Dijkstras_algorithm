import Foundation
import UIKit



/// графы и тд

enum EdgeType {
    case directed
    case undirected
}

struct Vertex<T> {
    let data: T
    let index: Int
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {

    var description: String{
        return "\(index):\(data)"
    }

}

protocol Graph {
    
    associatedtype Element
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    
}

class AdjacencyList <T: Hashable>: Graph {
    
    private var adjancencies: [Vertex<T>: [Edge<T>]] = [:]
    
    init() {}
    
    func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(data: data, index: adjancencies.count)
        adjancencies[vertex] = []
        return vertex
        
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>) {
        
        let edge = Edge(source: source, destination: destination)
        adjancencies[source]?.append(edge)
        
    }
    
    
    func addUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>) {
        
        addDirectedEdge(from: source, to: destination)
        addDirectedEdge(from: destination, to: source)
        
    }
    
    func add(_ edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>) {
        
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination)
        case .undirected:
            addUndirectedEdge(between: source, and: destination)
        }
        
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjancencies[source] ?? []
    }
    
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjancencies { // 1
            var edgeString = ""
            for (index, edge) in edges.enumerated() { // 2
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n") // 3
        }
        return result
    }
    
}

let graph = AdjacencyList<String>()

let parnas = graph.createVertex(data: "Парнас")
let prospectProsvesheniya = graph.createVertex(data: "Проспект Просвещения")

let captainAmerica = graph.createVertex(data: "Captain America")
let antMan = graph.createVertex(data: "Ant Man")
let civilWar = graph.createVertex(data: "Civil War")
let avengers = graph.createVertex(data: "Avengers")
let thor = graph.createVertex(data: "Thor")
let ragnarok = graph.createVertex(data: "Ragnarok")
let hulk = graph.createVertex(data: "Hulk")

graph.add(.undirected, from: parnas, to: prospectProsvesheniya)
//graph.add(.undirected, from: spiderMan, to: civilWar)
//graph.add(.undirected, from: spiderMan, to: avengers)
//graph.add(.undirected, from: ironMan, to: avengers)
//graph.add(.undirected, from: ironMan, to: civilWar)
//graph.add(.undirected, from: captainAmerica, to: civilWar)
//graph.add(.undirected, from: captainAmerica, to: avengers)
//graph.add(.undirected, from: captainAmerica, to: antMan)
//graph.add(.undirected, from: antMan, to: civilWar)
//graph.add(.undirected, from: antMan, to: avengers)
//graph.add(.undirected, from: thor, to: avengers)
//graph.add(.undirected, from: thor, to: ragnarok)
//graph.add(.undirected, from: hulk, to: avengers)
//graph.add(.undirected, from: hulk, to: ragnarok)
//
//print(graph)




