import UIKit
import Foundation


// алгоритм Дейкстры

class Station : UIButton  {  //  станции - вершины графа
    var known : Bool = false
    var id : Int = 0
    var name : String = ""
}

class Edge : UIBezierPath { // пути - грани графа
    var distance : Int = 0 
}

class Graph : Station {
        
}





