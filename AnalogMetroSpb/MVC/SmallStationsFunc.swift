import Foundation
import UIKit



@available(iOS 15.0, *)
extension BezierCurves {
    
    // MARK: рисуем мал станции
    func drawSmallStations(name: String,x:CGFloat, y:CGFloat, color: UIColor, id: Int) {
        
        let station = UIButton(frame: CGRect(x: x, y: y, width: 10, height: 10))
        station.tag = id
        let stationZ = Station(id: id, name: name)
        cleverAddingToStationsArr(id: id, station: stationZ)
        let newVertex = Vertex(data: stationZ, visited: false)
        Singleton.allVertexes.append(newVertex)
        Singleton.graph.info[id] = name 
        
        let stationName = UILabel()
        if name == "Василеостровская" {
            stationName.frame = CGRect(x: x+6, y: y-7, width: 65, height: 10)
        } else if name == "Балтийская" {
            stationName.frame = CGRect(x: x+12, y: y+5, width: 65, height: 10)
        } else if name == "Адмиралтейская" {
            stationName.frame = CGRect(x: x-57, y: y, width: 65, height: 10)
        } else if name == "Лиговский проспект" {
            stationName.frame = CGRect(x: x - 25, y: y+10, width: 65, height: 10)
        } else {
            stationName.frame = CGRect(x: x+12, y: y+2, width: 65, height: 10)
        }
        station.backgroundColor = color
        station.layer.cornerRadius = station.frame.size.height/2
        station.layer.borderWidth = 2
        station.layer.borderColor = UIColor.white.cgColor
        stationName.text = name
        stationName.numberOfLines = 0
        stationName.tintColor = UIColor.black
        stationName.font = .boldSystemFont(ofSize: 6)
        stationName.sizeToFit()
        self.addSubview(station)
        self.addSubview(stationName)
    }
    
    func cleverAddingToStationsArr(id: Int, station: Station) {
        if id <= 18 {
            blueStationsArr.append(station)
        } else if id > 18 && id <= 37 {
            redStationsArr.append(station)
        } else if id > 37 && id <= 52 {
            purpleStationsArr.append(station)
        } else if id > 52 && id <= 64 {
            greenStationsArr.append(station)
        } else if id > 64 && id <= 72 {
            orangeStationsArr.append(station)
        }
    }
}
