import Foundation
import UIKit


@available(iOS 15.0, *)
extension BezierCurves {
    
    // MARK: рисуем большие станции с переходами
    func drawBigStations(name: String,x: CGFloat, y:CGFloat,color: UIColor, id: Int) {
        
        let station = UIButton()
        if name == "Невский проспект" {
            station.frame = CGRect(x: x+2.5, y: y-7, width: 15, height: 15)
        } else if name == "Гостиный двор" {
            station.frame = CGRect(x: x+2.5, y: y+9, width: 15, height: 15)
        } else if name == "Садовая" {
            station.frame = CGRect(x: x-5.5, y: y+5, width: 15, height: 15)
        } else if name == "Сенная площадь" {
            station.frame = CGRect(x: x+2.5, y: y-9, width: 15, height: 15)
        } else if name == "Спасская" {
            station.frame = CGRect(x: x+10.5, y: y+5, width: 15, height: 15)
        } else if name == "Технологический институт 2" {
            station.frame = CGRect(x: x+2.5, y: y-7, width: 15, height: 15)
        } else if name == "Технологический институт 1" {
            station.frame = CGRect(x: x+2.5, y: y+9, width: 15, height: 15)
        } else if name == "Площадь восстания" {
            station.frame = CGRect(x: x+2.5, y: y-7, width: 15, height: 15)
        } else if name == "Маяковская" {
            station.frame = CGRect(x: x+1, y: y+9, width: 15, height: 15)
        } else if name == "Владимирская" {
            station.frame = CGRect(x: x+4.5, y: y-4.5, width: 15, height: 15)
        } else if name == "Достоевская" {
            station.frame = CGRect(x: x-0.5, y: y+11, width: 15, height: 15)
        } else if name == "Площадь Александра Невского 2" {
            station.frame = CGRect(x: x+2.5, y: y+9, width: 15, height: 15)
        } else if name == "Площадь Александра Невского 1" {
            station.frame = CGRect(x: x+2.5, y: y-7, width: 15, height: 15)
        } else if name == "Пушкинская" {
            station.frame = CGRect(x: x+5.5, y: y-7, width: 15, height: 15)
        } else if name == "Звенигородская" {
            station.frame = CGRect(x: x-3.5, y: y+7, width: 15, height: 15)
        } else {
            station.frame = CGRect(x: x, y: y, width: 15, height: 15)
        }
        
        station.tag = id
        let stationZ = Station(id: id, name: name)
        cleverAddingToStationsArr(id: id, station: stationZ)
        let newVertex = Vertex(data: stationZ, visited: false)
        Singleton.allVertexes.append(newVertex)
        Singleton.graph.bigStationsArrIds.insert(id)
        Singleton.graph.info[id] = name 
        
        let stationName = UILabel()
        if name == "Невский проспект" {
            stationName.frame = CGRect(x: x+20, y: y-10, width: 50, height: 10)
            stationName.textColor = .blue
        } else if name == "Гостиный двор" {
            stationName.frame = CGRect(x: x+20, y: y+15, width: 50, height: 10)
            stationName.textColor = .green
        } else if name == "Спасская" {
            stationName.frame = CGRect(x: x+27, y: y+15, width: 50, height: 10)
            stationName.textColor = .orange
        } else if name == "Садовая" {
            stationName.frame = CGRect(x: x-35, y: y+12, width: 50, height: 10)
            stationName.textColor = .purple
        } else if name == "Технологический институт 2" {
            stationName.frame = CGRect(x: x-60, y: y - 5, width: 60, height: 10)
            stationName.textColor = .blue
            stationName.textAlignment = .right
        } else if name == "Технологический институт 1" {
            stationName.frame = CGRect(x: x+20, y: y + 8, width: 60, height: 10)
            stationName.textColor = .red
            stationName.textAlignment = .left
        } else if name == "Сенная площадь" {
            stationName.textColor = .blue
            stationName.frame = CGRect(x: x+20, y: y-10, width: 50, height: 10)
        } else if name == "Площадь восстания" {
            stationName.textColor = .red
            stationName.frame = CGRect(x: x+20, y: y-6, width: 50, height: 10)
        } else if name == "Маяковская" {
            stationName.textColor = .green
            stationName.frame = CGRect(x: x+22, y: y+11, width: 50, height: 10)
        } else if name == "Владимирская" {
            stationName.textColor = .red
            stationName.frame = CGRect(x: x+22, y: y, width: 50, height: 10)
        } else if name == "Достоевская" {
            stationName.textColor = .orange
            stationName.frame = CGRect(x: x+22, y: y+11, width: 50, height: 10)
        } else if name == "Площадь Александра Невского 1" {
            stationName.textColor = .green
            stationName.frame = CGRect(x: x+22, y: y-13, width: 50, height: 10)
        } else if name == "Площадь Александра Невского 2" {
            stationName.textColor = .orange
            stationName.frame = CGRect(x: x+22, y: y+10, width: 50, height: 10)
        } else if name == "Пушкинская" {
            stationName.textColor = .red
            stationName.frame = CGRect(x: x+22, y: y, width: 50, height: 10)
        } else if name == "Звенигородская" {
            stationName.textColor = .purple
            stationName.frame = CGRect(x: x+18, y: y+10, width: 60, height: 10)
        } else {
            stationName.frame = CGRect(x: x+22, y: y-10, width: 50, height: 10)
            stationName.textColor = .black
        }
        
        station.backgroundColor = color
        station.layer.cornerRadius = station.frame.size.height/2
        station.layer.borderWidth = 2
        station.layer.borderColor = UIColor.white.cgColor
        stationName.text = name
        stationName.numberOfLines = 0
        stationName.font = .boldSystemFont(ofSize: 6)
        stationName.sizeToFit()
        self.addSubview(station)
        self.addSubview(stationName)
    }
    func makeStackView(frame: CGRect) -> UIStackView {
        let stackView = UIStackView(frame: frame)
        stackView.axis = .vertical
        stackView.spacing = 2.0
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = stackView.frame.height/2
        return stackView
    }
}
