import Foundation


@available(iOS 15.0, *)
extension AdjacencyList {
    // MARK: Dijkstra's Algorithm
    
    func dijkstrasAlgorithm(from: Vertex<Station>, to: Vertex<Station>) {
        
        var shortestPath: [Vertex<Station>: Int] = [:]
        let operation1 = BlockOperation { [weak self] in
            self?.distancies[from] = 0
            for vertex in Singleton.allVertexes {
                if vertex != from {
                    self?.distancies[vertex] = 1000_000
                }
            }
        }
        let operation2 = BlockOperation { [weak self] in
            while ((self?.distancies.values.contains(1000_000)) != nil) {
                guard
                    let smallestOne = self?.distancies
                        .sorted(by: {$0.value < $1.value}).first?.key else { return }
                shortestPath[smallestOne] = self?.distancies[smallestOne]
                guard
                    let edges = self?.adjacencies[smallestOne] else { return }
                for edge in edges {
                    let oldDistance = self?.distancies[edge.destination]
                    let newDistance = (self?.distancies[smallestOne] ?? 0) + edge.weight
                    if newDistance < (oldDistance ?? 0) {
                        self?.distancies[edge.destination] = newDistance
                        self?.distanciesCopy[edge.destination] = newDistance
                        // MARK: Добавляем предыдущую вершину согласно кратчайшего пути
                        self?.pathDict[edge.destination] = edge.source
                    }
                }
                self?.distancies.removeValue(forKey: smallestOne)
            }
        }
        let operation3 = BlockOperation { [self] in
            // MARK: find shortest path
            path.append(to)
            for _ in 0...pathDict.count {
                if path.last != from {
                    guard
                        let previousVertex = self.pathDict[path.last!] else { return }
                    path.append(previousVertex)
                }
            }
        }
        let operation4 = BlockOperation { [self] in
            var shortestPath1 = path
            shortestPath1.reverse()
            path = shortestPath1
            print(path)
        }
        
        let operation5 = BlockOperation { [self] in
            detailsInfoArr.append((path.first?.data.name)!)
            for (key,value) in distanciesCopy.sorted(by: {$0.value < $1.value}) {
                if path.contains(key) && !detailsInfoArr.contains(key.data.name) {
                    detailsInfoArr.append("-- \(value) мин --> \(key.data.name)")
                }
            }
            print(detailsInfoArr)
        }
        
        let queue: OperationQueue = {
            let queue = OperationQueue()
            queue.maxConcurrentOperationCount = 1
            queue.qualityOfService = .userInitiated
            return queue
        }()
        
        operation2.addDependency(operation1)
        operation3.addDependency(operation2)
        operation4.addDependency(operation3)
        operation5.addDependency(operation4)

        queue.addOperations([operation1,operation2,operation3,operation4, operation5], waitUntilFinished: true)
    }
}
