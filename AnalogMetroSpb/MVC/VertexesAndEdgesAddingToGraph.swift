import Foundation
import UIKit


@available(iOS 15.0, *)
extension BezierCurves {
    func addVertexesAndEdgesToGraph(arrStations:[Station], arrWeights: [Int]) {
        for (index,value) in arrStations.enumerated() {
            let nextIndex = index + 1
            if nextIndex != arrStations.count {
                // MARK: одно направление
                Singleton.graph.add(from: Vertex(data: Station(id: value.id,
                                                     name: arrStations[index].name)),
                          to: Vertex(data: Station(id: value.id + 1,
                                                   name: arrStations[nextIndex].name)),
                          weight: arrWeights[index])
                // MARK: противоположное направление
                Singleton.graph.add(from: Vertex(data: Station(id: value.id + 1,
                                                     name: arrStations[nextIndex].name)),
                          to: Vertex(data: Station(id: value.id,
                                                   name: arrStations[index].name)),
                          weight: arrWeights[index])
            }
        }
    }
    func addTransitionWays() {
        // MARK: добавляем переходы для каждой вершины прямым вызовом метода
        // MARK: Невский - Гостинка и обратно
        Singleton.graph.add(from: Vertex(data: Station(id: 9, name: "Невский проспект")),
                  to: Vertex(data: Station(id: 57, name: "Гостиный двор")),
                  weight: 4)
        Singleton.graph.add(from: Vertex(data: Station(id: 57, name: "Гостиный двор")),
                  to: Vertex(data: Station(id: 9, name: "Невский проспект")),
                  weight: 4)
        
        // MARK: Площадь Восстания - Маяковская и обратно
        Singleton.graph.add(from: Vertex(data: Station(id: 28, name: "Площадь восстания")),
                  to: Vertex(data: Station(id: 58, name: "Маяковская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 58, name: "Маяковская")),
                  to: Vertex(data: Station(id: 28, name: "Площадь восстания")),
                  weight: 3)
        
        // MARK: Сенная площадь - Садовая, Спасская и наоборот во всех направлениях
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
        
        // MARK: Владимирская - Достоевская и обратно
        Singleton.graph.add(from: Vertex(data: Station(id: 29, name: "Владимирская")),
                  to: Vertex(data: Station(id: 66, name: "Достоевская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 66, name: "Достоевская")),
                  to: Vertex(data: Station(id: 29, name: "Владимирская")),
                  weight: 3)
        
        // MARK: Пл. Александра Невского 1 - 2 и обратно
        Singleton.graph.add(from: Vertex(data: Station(id: 59, name: "Площадь Александра Невского 1")),
                  to: Vertex(data: Station(id: 68, name: "Площадь Александра Невского 2")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 68, name: "Площадь Александра Невского 2")),
                  to: Vertex(data: Station(id: 59, name: "Площадь Александра Невского 1")),
                  weight: 3)
        
        // MARK: Пушкинская - Звенигородская и обратно
        Singleton.graph.add(from: Vertex(data: Station(id: 30, name: "Пушкинская")),
                  to: Vertex(data: Station(id: 45, name: "Звенигородская")),
                  weight: 3)
        Singleton.graph.add(from: Vertex(data: Station(id: 45, name: "Звенигородская")),
                  to: Vertex(data: Station(id: 30, name: "Пушкинская")),
                  weight: 3)
        
        // MARK: Техн. институт 1 - 2 и обратно
        Singleton.graph.add(from: Vertex(data: Station(id: 11, name: "Технологический институт 2")),
                  to: Vertex(data: Station(id: 31, name: "Технологический институт 1")),
                  weight: 2)
        Singleton.graph.add(from: Vertex(data: Station(id: 31, name: "Технологический институт 1")),
                  to: Vertex(data: Station(id: 11, name: "Технологический институт 2")),
                  weight: 2)
    }
}
