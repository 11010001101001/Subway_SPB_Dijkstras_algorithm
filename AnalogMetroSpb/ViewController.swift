//
//  ViewController.swift
//  AnalogMetroSpb
//
//  Created by Admin on 13.08.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
//    @IBOutlet weak var mapScrollView: MapScrollView!
    @IBOutlet weak var map: UIView!
    
    var mapScrollView : MapScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapScrollView = MapScrollView(frame: view.bounds)
        view.addSubview(mapScrollView)
        setupMapScrollView()
        
        let image = map
        self.mapScrollView.set(image: image)
        
        
        // мал станции
        func drawSmallStations(name: String,x:CGFloat, y:CGFloat, color: UIColor) -> CGRect {
            let station = UIButton(frame: CGRect(x: x, y: y, width: 10, height: 10))
            let stationName = UILabel(frame: CGRect(x: x+12, y: y, width: 50, height: 10))
            station.backgroundColor = color
            station.layer.cornerRadius = station.frame.size.height/2
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.tintColor = UIColor.black
            stationName.font = UIFont.systemFont(ofSize: 9)
            stationName.sizeToFit()
            map.addSubview(station)
            map.addSubview(stationName)
            return station.frame
        }
        // большие станции с переходами
        func drawBigStations(name: String,x: CGFloat, y:CGFloat) -> CGRect {
            let station = UIButton(frame: CGRect(x: x, y: y, width: 20, height: 20))
            let stationName = UILabel(frame: CGRect(x: x+22, y: y-2, width: 50, height: 10))
            station.backgroundColor = .gray
            station.layer.cornerRadius = station.frame.size.height/2
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.tintColor = UIColor.black
            stationName.font = UIFont.systemFont(ofSize: 10)
            stationName.sizeToFit()
            map.addSubview(station)
            map.addSubview(stationName)
            return station.frame
        }
        // лейблы там, где пересечение станций и нет смысла рисовать новую станцию
        func drawLabel(name:String,x:CGFloat,y:CGFloat,color: UIColor ) -> CGRect {
            let stationName = UILabel(frame: CGRect(x: x, y: y, width: 75, height: 10))
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.textColor = color
            stationName.font = UIFont.systemFont(ofSize: 10)
            stationName.sizeToFit()
            map.addSubview(stationName)
            return stationName.frame
        }
        // лейблы поуже в ширину иногда надо где не влазит
        func drawLabelMin(name:String,x:CGFloat,y:CGFloat,color: UIColor ) -> CGRect {
            let stationName = UILabel(frame: CGRect(x: x, y: y, width: 50, height: 10))
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.textColor = color
            stationName.font = UIFont.systemFont(ofSize: 10)
            stationName.sizeToFit()
            map.addSubview(stationName)
            return stationName.frame
        }
        
        // рисуем синюю ветку
        drawSmallStations(name: "Парнас",x: 160,y: 24,color: .blue)
        drawSmallStations(name: "Проспект просвещения",x: 160,y: 54, color: .blue)
        drawSmallStations(name: "Озерки",x: 160,y: 84, color: .blue)
        drawSmallStations(name: "Удельная",x: 160,y: 114, color: .blue)
        drawSmallStations(name: "Пионерская",x: 160,y: 144, color: .blue)
        drawSmallStations(name: "Черная речка",x: 160,y: 174, color: .blue)
        drawSmallStations(name: "Петроградская",x: 160,y: 224, color: .blue)
        drawSmallStations(name: "Горьковская",x: 160,y: 254, color: .blue)
        drawBigStations(name: "Невский проспект",x: 155, y: 294)
        drawBigStations(name: "Сенная площадь",x: 155, y: 344)
        drawBigStations(name: "",x: 155, y: 450)
        drawLabel(name: "Технологический институт 2", x: 75, y: 448, color: .blue)
        drawSmallStations(name: "Фрунзенская",x: 160,y: 480, color: .blue)
        drawSmallStations(name: "Московские ворота",x: 160,y: 510, color: .blue)
        drawSmallStations(name: "Электросила",x: 160,y: 540, color: .blue)
        drawSmallStations(name: "Парк Победы",x: 160,y: 570, color: .blue)
        drawSmallStations(name: "Московская",x: 160,y: 600, color: .blue)
        drawSmallStations(name: "Звездная",x: 160,y: 630, color: .blue)
        drawSmallStations(name: "Купчино",x: 160,y: 660, color: .blue)
        // рисуем красную ветку
        drawSmallStations(name: "Девяткино",x: 250, y: 50,color: .red)
        drawSmallStations(name: "Гражданский проспект",x: 250, y: 80,color: .red)
        drawSmallStations(name: "Академическая",x: 250, y: 110,color: .red)
        drawSmallStations(name: "Политехническая",x: 250, y: 140,color: .red)
        drawSmallStations(name: "Площадь мужества",x: 250, y: 170,color: .red)
        drawSmallStations(name: "Лесная",x: 250, y: 200,color: .red)
        drawSmallStations(name: "Выборгская",x: 250, y: 220,color: .red)
        drawSmallStations(name: "Площадь Ленина",x: 250, y: 240,color: .red)
        drawSmallStations(name: "Чернышевская",x: 250, y: 260,color: .red)
        drawBigStations(name: "Площадь восстания", x: 245, y: 294)
        drawBigStations(name: "Владимирская", x: 235, y: 344)
        drawBigStations(name: "Пушкинская", x: 215, y: 400)
        drawLabel(name: "Технологический институт 1", x: 75, y: 425, color: .red)
        drawSmallStations(name: "Балтийская",x: 80, y: 485,color: .red)
        drawSmallStations(name: "Нарвская",x: 80, y: 510,color: .red)
        drawSmallStations(name: "Кировский завод",x: 80, y: 535,color: .red)
        drawSmallStations(name: "Автово",x: 80, y: 570,color: .red)
        drawSmallStations(name: "Ленинский проспект",x: 80, y: 600,color: .red)
        drawSmallStations(name: "Проспект Ветеранов",x: 80, y: 630,color: .red)
        // рисуем фиолетовую ветку
        drawSmallStations(name: "Комендантский проспект",x: 80,y: 120, color: .purple)
        drawSmallStations(name: "Старая деревня",x: 80,y: 150, color: .purple)
        drawSmallStations(name: "Крестовский остров",x: 80,y: 170, color: .purple)
        drawSmallStations(name: "Чкаловская",x: 80,y: 190, color: .purple)
        drawSmallStations(name: "Спортивная",x: 80,y: 210, color: .purple)
        drawSmallStations(name: "",x: 120,y: 320, color: .purple)
        drawLabel(name: "Адмиралтейская", x: 40, y: 320, color: .black)
        drawLabel(name: "Садовая", x: 110, y: 344, color: .purple)
        drawLabel(name: "Звенигородская", x: 135, y: 400, color: .purple)
        drawSmallStations(name: "Обводный канал",x: 236,y: 440, color: .purple)
        drawSmallStations(name: "Волховская",x: 236,y: 510, color: .purple)
        drawSmallStations(name: "Бухарестская",x: 236,y: 540, color: .purple)
        drawSmallStations(name: "Международная",x: 236,y: 570, color: .purple)
        drawSmallStations(name: "Проспект Славы",x: 236,y: 600, color: .purple)
        drawSmallStations(name: "Дунайская",x: 236,y: 630, color: .purple)
        drawSmallStations(name: "Шушары",x: 236,y: 660, color: .purple)
        // рисуем зеленую ветку
        drawSmallStations(name: "Беговая",x: 10,y: 224, color: .green)
        drawSmallStations(name: "Зенит",x: 20,y: 244, color: .green)
        drawSmallStations(name: "Приморская",x: 30,y: 266, color: .green)
        drawSmallStations(name: "Василеостровская",x: 40,y: 290, color: .green)
        drawLabelMin(name: "Гостиный двор", x: 105, y: 294, color: .green)
        drawLabelMin(name: "Маяковская", x: 320, y: 294, color: .green)
        drawBigStations(name: "", x: 295, y: 375)
        drawLabel(name: "Площадь Александра Невского 1", x: 320, y: 375, color: .green)
        drawSmallStations(name: "Елизаровская",x: 300,y: 560, color: .green)
        drawSmallStations(name: "Ломоносовская",x: 300,y: 590, color: .green)
        drawSmallStations(name: "Пролетарская",x: 300,y: 620, color: .green)
        drawSmallStations(name: "Обухово",x: 300,y: 650, color: .green)
        drawSmallStations(name: "Рыбацкое",x: 300,y: 680, color: .green)
        // рисуем оранжевую ветку
        drawLabel(name: "Спасская", x: 108, y: 357, color: .orange)
        drawLabel(name: "Достоевская", x: 310, y: 344, color: .orange)
        drawSmallStations(name: "",x: 265,y: 375, color: .orange)
        drawLabel(name: "Лиговский проспект", x: 210, y: 370, color: .orange)
        drawLabel(name: "Площадь Александра Невского 2", x: 320, y: 410, color: .orange)
        drawSmallStations(name: "Новочеркасская",x: 310,y: 450, color: .orange)
        drawSmallStations(name: "Ладожская",x: 310,y: 480, color: .orange)
        drawSmallStations(name: "Проспект Большевиков",x: 310,y: 500, color: .orange)
        drawSmallStations(name: "Дыбенко",x: 310,y: 540, color: .orange)
    }
    
    func setupMapScrollView() {
        mapScrollView.translatesAutoresizingMaskIntoConstraints = false
        mapScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
}



