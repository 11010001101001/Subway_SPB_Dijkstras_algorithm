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

var shortestPath : [Vertex<Station>] = [] // массив кратчайшего пути станции вершины

func findVertexViaShortestEdge(from: Vertex<Station>, edges: [Edge<Station>]) -> Vertex<Station> {
    
    var tempV = Vertex(data: Station(id: 0, name: ""), visited: false)
    
    for (index,edge) in edges.enumerated() {
        
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
            tempV = unwrapped
        }
    }
    return tempV
}

// Алгоритм Дейкстры

extension Graph {
    public func route(to destination: Vertex<Station>, in tree: [Vertex<Station> : Visit<Station>]) -> [Edge<Station>] { // объявили функцию которая берет на вход конечную вершину к которой строим путь и дерево вершин в формате словаря вершина : вершина дерева которая возвращает массив ребер
        
        var vertex = destination // создаем переменную vertex чтобы положить в нее текущую конечную вершину
        
        var path : [Edge<Station>] = [] //  задаем переменную чтобы хранить ребра от корневой вершины до destination, пока что это пустой массив
        
        while let visit = tree[vertex],
              case .edge(let edge) = visit { // задаем цикл чтобы пройтись по всем вершинам, цикл проверяет посещена ли текущая вершина и что эта запись принимает форму ребра , когда этот тест не проходит цикл заканчивается
            
            path = [edge] + path
            vertex = edge.source // мы добавляем ребро в начало пути, и утверждаем что vertex это начало ребра edge.source ,  переместившись на шаг ближе к корневой вершине
        }
        return path // когда цикл закончился возвращаем массив ребер
    }
    public func distance(to destination: Vertex<Station>, in tree: [Vertex<Station> : Visit<Station>]) -> Double { // функция берет на вход вершину и словарь вершина : vertex visit и возвращает дистаницию от корневой вершины в формате double
        let path = route(to: destination, in: tree) // вызываем route функцию чтобы получить массив ребер в пути
        let distances = path.flatMap{ $0.weight } // Вы плоско наносите на карту каждое ребро по его весу. Если вес ребра каким-то образом должен быть равен нулю, здесь это ребро незаметно игнорируется.
        return distances.reduce(0.0, { $0 + Double($1) }) // Вы уменьшили массив расстояний до их общего количества (предполагая, что путь без ребер имеет расстояние 0,0, а затем добавляете вес каждого ребра в пути по очереди)
    }
    public func dijkstra(from source: Vertex<Station>, to destination: Vertex<Station>) -> [Edge<Station>]? {
        var visits : [Vertex<Station> : Visit<Station>] = [source: .source]
        var priorityQueue = PriorityQueue<Vertex<Element>>(sort: { self.distance(to: $0, in: visits) < self.distance(to: $1, in: visits) })
        priorityQueue.enqueue(source)
        while let visitedVertex = priorityQueue.dequeue() { // мы удалили первый элемент из очереди приоритетов и назвали его visitedVertex
            if visitedVertex == destination { // проверили является ли visitedVertex destination ?
                return route(to: destination, in: visits) // Если посещенная вершина является конечной, вы вернули маршрут от исходной вершины к конечной вершине, как определено из дерева посещений.
            } // если не является будем исследовать соседнюю вершину и ее соседние вершины
            let neighbourEdges = edges(from: visitedVertex) ?? [] // Вы получаете список соседних ребер для посещенной вершины или создаете пустой список, если таковых нет.
            
            for edge in neighbourEdges { // проходимся циклом по соседним вершинам если они есть если нет итераций цикла не будет
                if let weight = edge.weight { // проверяем есть ли у ребра вес ? Есть две причины поставить соседнюю вершину в очередь. Во-первых, мы никогда с ними не сталкивались, а во-вторых, вы встречались с ними раньше, но у вас есть для них более короткий и приоритетный маршрут. Если мы встречались с вершиной раньше, но нашли более длинный путь к ней, чем вы, то вы хотите проигнорировать новый маршрут.По этим причинам теперь, когда у вас есть взвешенное ребро для соседней вершины, есть небольшое дублирование при принятии решения о постановке этой вершины в очередь
                    if visits[edge.destination] != nil { // Вы проверили, есть ли в дереве посещений запись для соседа текущей вершины. Если записи нет, вы собираетесь поставить эту вершину в очередь.
                        if distance(to: visitedVertex, in: visits) + weight < distance(to: edge.destination, in: visits) { // Если есть запись, вы проверяете, будет ли расстояние до текущей вершины, плюс вес, меньше расстояния, которое приоритетная очередь уже использует для определения приоритета соседа.
                            visits[edge.destination] = .edge(edge) // Вы создали или отменили запись в дереве посещений для соседа. Теперь дерево будет использовать эту запись для определения приоритета вершины.
                            priorityQueue.enqueue(edge.destination) // вы добавили соседа в приоритетную очередь
                        }
                    } else { // Вы проверили, есть ли в дереве посещений запись для соседа текущей вершины. Если записи нет, вы собираетесь поставить эту вершину в очередь
                        visits[edge.destination] = .edge(edge) // Вы создали или отменили запись в дереве посещений для соседа. Теперь дерево будет использовать эту запись для определения приоритета вершины
                        priorityQueue.enqueue(edge.destination) // вы добавили соседа в приоритетную очередь
                    }              }
            }        }
        return nil
    }
}
enum Visit<Station: Hashable> {
    case source
    case edge(Edge<Station>)
}

struct Heap<Element> {
  var elements : [Element]
  let priorityFunction : (Element, Element) -> Bool
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) { // 1 // 2
      self.elements = elements
      self.priorityFunction = priorityFunction // 3
      buildHeap() // 4
    }

    mutating func buildHeap() {
      for index in (0 ..< count / 2).reversed() { // 5
        siftDown(elementAtIndex: index) // 6
      }
    }

    var isEmpty : Bool {
      return elements.isEmpty
    }

    var count : Int {
      return elements.count
    }
    func peek() -> Element? {
      return elements.first
    }
    mutating func enqueue(_ element: Element) {
      elements.append(element)
      siftUp(elementAtIndex: count - 1)
    }
    mutating func siftUp(elementAtIndex index: Int) {
      let parent = parentIndex(of: index) // 1
      guard !isRoot(index), // 2
        isHigherPriority(at: index, than: parent) // 3
        else { return }
      swapElement(at: index, with: parent) // 4
      siftUp(elementAtIndex: parent) // 5
    }
    mutating func dequeue() -> Element? {
      guard !isEmpty // 1
        else { return nil }
      swapElement(at: 0, with: count - 1) // 2
      let element = elements.removeLast() // 3
      if !isEmpty { // 4
        siftDown(elementAtIndex: 0) // 5
      }
      return element // 6
    }
    mutating func siftDown(elementAtIndex index: Int) {
      let childIndex = highestPriorityIndex(for: index) // 1
      if index == childIndex { // 2
        return
      }
      swapElement(at: index, with: childIndex) // 3
      siftDown(elementAtIndex: childIndex)
    }
    func isRoot(_ index: Int) -> Bool {
      return (index == 0)
    }

    func leftChildIndex(of index: Int) -> Int {
      return (2 * index) + 1
    }

    func rightChildIndex(of index: Int) -> Int {
      return (2 * index) + 2
    }

    func parentIndex(of index: Int) -> Int {
      return (index - 1) / 2
    }
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
      return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
      guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
        else { return parentIndex }
      return childIndex
    }
        
    func highestPriorityIndex(for parent: Int) -> Int {
      return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
      guard firstIndex != secondIndex
        else { return }
      swap(&elements[firstIndex], &elements[secondIndex])
    }
}
public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  /*
    To create a max-priority queue, supply a > sort function. For a min-priority
    queue, use <.
  */
  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(_ element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }

  /*
    Allows you to change the priority of an element. In a max-priority queue,
    the new priority should be larger than the old one; in a min-priority queue
    it should be smaller.
  */
  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}

extension PriorityQueue where T: Equatable {
  public func index(of element: T) -> Int? {
    return heap.index(of: element)
  }
}

