import Foundation
import UIKit


@available(iOS 15.0, *)
extension BezierCurves {
    // MARK: Adding to graph vertexes and edges
    func addVertexesAndEdgesToGraph(arrStations:[Station], arrWeights: [Int]) {
        for (index,value) in arrStations.enumerated() {
            let nextIndex = index + 1
            if nextIndex != arrStations.count {
                // MARK: one direction
                Singleton.graph.add(from: Vertex(data: Station(id: value.id,
                                                     name: arrStations[index].name)),
                          to: Vertex(data: Station(id: value.id + 1,
                                                   name: arrStations[nextIndex].name)),
                          weight: arrWeights[index])
                // MARK: another directions
                Singleton.graph.add(from: Vertex(data: Station(id: value.id + 1,
                                                     name: arrStations[nextIndex].name)),
                          to: Vertex(data: Station(id: value.id,
                                                   name: arrStations[index].name)),
                          weight: arrWeights[index])
            }
        }
    }
    func addTransitionWays() {
        // MARK: let's add stations connections - important - for both directions 
        Singleton.graph.add(from: Vertex(data: Station(id: 9, name: "Невский проспект")),
                  to: Vertex(data: Station(id: 57, name: "Гостиный двор")),
                  weight: 4)
        Singleton.graph.add(from: Vertex(data: Station(id: 57, name: "Гостиный двор")),
                  to: Vertex(data: Station(id: 9, name: "Невский проспект")),
                  weight: 4)
        
        Singleton.graph.add(from: Vertex(data: Station(id: 28, name: "Площадь восстания")),
                  to: Vertex(data: Station(id: 58, name: "Маяковская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 58, name: "Маяковская")),
                  to: Vertex(data: Station(id: 28, name: "Площадь восстания")),
                  weight: 3)
        
        Singleton.graph.add(from: Vertex(data: Station(id: 10, name: "Сенная площадь")),
                  to: Vertex(data: Station(id: 44, name: "Садовая")),
                  weight: 4)
        Singleton.graph.add(from: Vertex(data: Station(id: 10, name: "Сенная площадь")),
                  to: Vertex(data: Station(id: 65, name: "Спасская")),
                  weight: 4)
        Singleton.graph.add(from: Vertex(data: Station(id: 44, name: "Садовая")),
                  to: Vertex(data: Station(id: 65, name: "Спасская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 44, name: "Садовая")),
                  to: Vertex(data: Station(id: 10, name: "Сенная площадь")),
                  weight: 4)
        Singleton.graph.add(from: Vertex(data: Station(id: 65, name: "Спасская")),
                  to: Vertex(data: Station(id: 10, name: "Сенная площадь")),
                  weight: 4)
        Singleton.graph.add(from: Vertex(data: Station(id: 65, name: "Спасская")),
                  to: Vertex(data: Station(id: 44, name: "Садовая")),
                  weight: 3)
        
        Singleton.graph.add(from: Vertex(data: Station(id: 29, name: "Владимирская")),
                  to: Vertex(data: Station(id: 66, name: "Достоевская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 66, name: "Достоевская")),
                  to: Vertex(data: Station(id: 29, name: "Владимирская")),
                  weight: 3)
        
        Singleton.graph.add(from: Vertex(data: Station(id: 59, name: "Площадь Александра Невского 1")),
                  to: Vertex(data: Station(id: 68, name: "Площадь Александра Невского 2")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 68, name: "Площадь Александра Невского 2")),
                  to: Vertex(data: Station(id: 59, name: "Площадь Александра Невского 1")),
                  weight: 3)
        
        Singleton.graph.add(from: Vertex(data: Station(id: 30, name: "Пушкинская")),
                  to: Vertex(data: Station(id: 45, name: "Звенигородская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 45, name: "Звенигородская")),
                  to: Vertex(data: Station(id: 30, name: "Пушкинская")),
                  weight: 3)
        
        Singleton.graph.add(from: Vertex(data: Station(id: 11, name: "Технологический институт 2")),
                  to: Vertex(data: Station(id: 31, name: "Технологический институт 1")),
                  weight: 2)
        Singleton.graph.add(from: Vertex(data: Station(id: 31, name: "Технологический институт 1")),
                  to: Vertex(data: Station(id: 11, name: "Технологический институт 2")),
                  weight: 2)
    }
}
