import UIKit
import Foundation



class Graph {
    
}


class Station : UIButton  {  //  станции - вершины графа для алгоритма Дейкстры
    var id : Int = 0
    var name : String = ""
}

class Edges : UIBezierPath { // пути - грани графа
    var distance : Int = 0 
}
