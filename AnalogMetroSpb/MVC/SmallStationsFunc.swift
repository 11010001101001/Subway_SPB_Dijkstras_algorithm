import Foundation
import UIKit

extension BezierCurves {
    /// small(no other stations connected i mean) stations drawing
    func drawSmallStations(name: String,x:CGFloat, y:CGFloat, color: UIColor, id: Int) {
        let stationName = UILabel()
        let station = UIButton(frame: CGRect(x: x-2.5, y: y-2.5, width: 15, height: 15))
        station.tag = id
        
        let stationZ = Station(id: id, name: name)
        cleverAddingToStationsArr(id: id, station: stationZ)
        
        let newVertex = Vertex(data: stationZ)
        Singleton.allVertexes.append(newVertex)
        Singleton.graph.info[id] = name 
        
        if name == "Василеостровская" {
            stationName.frame = CGRect(x: x+6, y: y-7, width: 65, height: 10)
        } else if name == "Балтийская" {
            stationName.frame = CGRect(x: x+12, y: y+5, width: 65, height: 10)
        } else if name == "Адмиралтейская" {
            stationName.frame = CGRect(x: x-57, y: y, width: 65, height: 10)
        } else if name == "Лиговский проспект" {
            stationName.frame = CGRect(x: x - 25, y: y+10, width: 65, height: 10)
            stationName.textColor = .orange
        } else if name == "Московские ворота" {
            stationName.frame = CGRect(x: x+13, y: y+2, width: 55, height: 10)
            stationName.numberOfLines = 0
        } else {
            stationName.frame = CGRect(x: x+13, y: y+2, width: 65, height: 10)
        }
        
        station.backgroundColor = color
        station.layer.cornerRadius = station.frame.size.height/2
        station.layer.borderWidth = 1
        station.layer.borderColor = UIColor.white.cgColor
        stationName.text = name
        stationName.numberOfLines = 0
        stationName.tintColor = UIColor.black
        stationName.font = .boldSystemFont(ofSize: 6)
        stationName.sizeToFit()
        addSubview(station)
        addSubview(stationName)
    }
    // MARK: adding to arr stations filtered by id according to their lines
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
