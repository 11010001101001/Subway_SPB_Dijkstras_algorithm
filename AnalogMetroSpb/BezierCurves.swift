//
//  BezierCurves.swift
//  AnalogMetroSpb
//
//  Created by Admin on 17.08.2021.
//

import UIKit




class BezierCurves: UIView {
    
    
    
    override func draw(_ rect: CGRect) {
        
        
        let stackView1 = UIStackView(frame: CGRect(x: 157.5, y: 286, width: 15, height: 32))
        stackView1.axis = .vertical
        stackView1.spacing = 2.0
        stackView1.distribution = .fillEqually
        stackView1.backgroundColor = .white
        stackView1.layer.cornerRadius = stackView1.frame.height/2
        let stackView2 = UIStackView(frame: CGRect(x: 247, y: 286, width: 15, height: 32))
        stackView2.axis = .vertical
        stackView2.spacing = 2.0
        stackView2.distribution = .fillEqually
        stackView2.backgroundColor = .white
        stackView2.layer.cornerRadius = stackView1.frame.height/2
        
        //  рисуем мал станции
        func drawSmallStations(name: String,x:CGFloat, y:CGFloat, color: UIColor, id: Int) {
            
            let station = Station(frame: CGRect(x: x, y: y, width: 10, height: 10))
            station.id = id
            station.tag = id
            station.name = name
            let stationName = UILabel(frame: CGRect(x: x+12, y: y, width: 60, height: 10))
            station.backgroundColor = color
            station.layer.cornerRadius = station.frame.size.height/2
            station.layer.borderWidth = 1
            station.layer.borderColor = UIColor.white.cgColor
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.tintColor = UIColor.black
            stationName.font = UIFont.systemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(station)
            self.addSubview(stationName)
        }
        // рисуем большие станции с переходами
        func drawBigStations(name: String,x: CGFloat, y:CGFloat,color: UIColor, id: Int) {
            let station = Station(frame: CGRect(x: x, y: y, width: 15, height: 15))
            station.id = id
            station.tag = id
            station.name = name
            let stationName = UILabel(frame: CGRect(x: x+22, y: y-2, width: 50, height: 10))
            station.backgroundColor = color
            station.layer.cornerRadius = station.frame.size.height/2
            station.layer.borderWidth = 1
            station.layer.borderColor = UIColor.white.cgColor
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.tintColor = UIColor.black
            stationName.font = UIFont.systemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(station)
            self.addSubview(stationName)
            
            if station.id == 9 {
                stackView1.addArrangedSubview(station)
                self.addSubview(stackView1)
            }
            if station.id == 57 {
                stackView1.addArrangedSubview(station)
                self.addSubview(stackView1)
            }
            if station.id == 28 {
                stackView2.addArrangedSubview(station)
                self.addSubview(stackView2)
            }
            if station.id == 58 {
                stackView2.addArrangedSubview(station)
                self.addSubview(stackView2)
            }
        }
        // вспомогательные лейблы там, где пересечение станций и нет смысла рисовать новую станцию
        func drawLabel(name:String,x:CGFloat,y:CGFloat,color: UIColor ) {
            let stationName = UILabel(frame: CGRect(x: x, y: y, width: 75, height: 10))
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.textColor = color
            stationName.font = UIFont.systemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(stationName)
        }
        // вспомогательные лейблы поуже в ширину иногда надо где не влазит
        func drawLabelMin(name:String,x:CGFloat,y:CGFloat,color: UIColor ) {
            let stationName = UILabel(frame: CGRect(x: x, y: y, width: 50, height: 10))
            stationName.text = name
            stationName.numberOfLines = 0
            stationName.textColor = color
            stationName.font = UIFont.systemFont(ofSize: 6)
            stationName.sizeToFit()
            self.addSubview(stationName)
        }
        
        
        // рисуем синюю ветку - станции
        drawSmallStations(name: "Парнас",x: 160,y: 24,color: .blue, id: 1)
        drawSmallStations(name: "Проспект просвещения",x: 160,y: 54, color: .blue, id: 2)
        drawSmallStations(name: "Озерки",x: 160,y: 84, color: .blue, id: 3)
        drawSmallStations(name: "Удельная",x: 160,y: 114, color: .blue, id: 4)
        drawSmallStations(name: "Пионерская",x: 160,y: 144, color: .blue, id: 5)
        drawSmallStations(name: "Черная речка",x: 160,y: 174, color: .blue, id: 6)
        drawSmallStations(name: "Петроградская",x: 160,y: 224, color: .blue, id: 7)
        drawSmallStations(name: "Горьковская",x: 160,y: 254, color: .blue, id: 8)
        drawBigStations(name: "Невский проспект",x: 155, y: 294, color: .blue, id: 9)
        drawBigStations(name: "Сенная площадь",x: 155, y: 344, color: .blue, id: 10)
        drawBigStations(name: "",x: 155, y: 450, color: .blue, id: 11)
        drawLabel(name: "Технологический институт 2", x: 75, y: 448, color: .blue)
        drawSmallStations(name: "Фрунзенская",x: 160,y: 480, color: .blue, id: 12)
        drawSmallStations(name: "Московские ворота",x: 160,y: 510, color: .blue, id: 13)
        drawSmallStations(name: "Электросила",x: 160,y: 540, color: .blue, id: 14)
        drawSmallStations(name: "Парк Победы",x: 160,y: 570, color: .blue, id: 15)
        drawSmallStations(name: "Московская",x: 160,y: 600, color: .blue, id: 16)
        drawSmallStations(name: "Звездная",x: 160,y: 630, color: .blue, id: 17)
        drawSmallStations(name: "Купчино",x: 160,y: 660, color: .blue, id: 18)
        // рисуем красную ветку - станции
        drawSmallStations(name: "Девяткино",x: 250, y: 50,color: .red, id: 19)
        drawSmallStations(name: "Гражданский проспект",x: 250, y: 80,color: .red, id: 20)
        drawSmallStations(name: "Академическая",x: 250, y: 110,color: .red, id: 21)
        drawSmallStations(name: "Политехническая",x: 250, y: 140,color: .red, id: 22)
        drawSmallStations(name: "Площадь мужества",x: 250, y: 170,color: .red, id: 23)
        drawSmallStations(name: "Лесная",x: 250, y: 200,color: .red, id: 24)
        drawSmallStations(name: "Выборгская",x: 250, y: 220,color: .red, id: 25)
        drawSmallStations(name: "Площадь Ленина",x: 250, y: 240,color: .red, id: 26)
        drawSmallStations(name: "Чернышевская",x: 250, y: 260,color: .red, id: 27)
        drawBigStations(name: "Площадь восстания", x: 245, y: 294, color: .red, id: 28)
        drawBigStations(name: "Владимирская", x: 235, y: 344, color: .red, id: 29)
        drawBigStations(name: "Пушкинская", x: 215, y: 400, color: .red, id: 30)
        drawBigStations(name: "", x: 155, y: 450, color: .red, id: 31)
        drawLabel(name: "Технологический институт 1", x: 75, y: 425, color: .red)
        drawSmallStations(name: "Балтийская",x: 80, y: 485,color: .red, id: 32)
        drawSmallStations(name: "Нарвская",x: 80, y: 510,color: .red, id: 33)
        drawSmallStations(name: "Кировский завод",x: 80, y: 535,color: .red, id: 34)
        drawSmallStations(name: "Автово",x: 80, y: 570,color: .red, id: 35)
        drawSmallStations(name: "Ленинский проспект",x: 80, y: 600,color: .red, id: 36)
        drawSmallStations(name: "Проспект Ветеранов",x: 80, y: 630,color: .red, id: 37)
        // рисуем фиолетовую ветку - станции
        drawSmallStations(name: "Комендантский проспект",x: 80,y: 120, color: .purple, id: 38)
        drawSmallStations(name: "Старая деревня",x: 80,y: 150, color: .purple, id: 39)
        drawSmallStations(name: "Крестовский остров",x: 80,y: 170, color: .purple, id: 40)
        drawSmallStations(name: "Чкаловская",x: 80,y: 190, color: .purple, id: 41)
        drawSmallStations(name: "Спортивная",x: 80,y: 210, color: .purple, id: 42)
        drawSmallStations(name: "",x: 120,y: 320, color: .purple, id: 43)
        drawLabel(name: "Адмиралтейская", x: 40, y: 320, color: .black)
        drawBigStations(name: "",x: 155, y: 344, color: .purple, id: 44)
        drawLabel(name: "Садовая", x: 110, y: 344, color: .purple)
        drawBigStations(name: "", x: 215, y: 400, color: .purple, id: 45)
        drawLabel(name: "Звенигородская", x: 135, y: 400, color: .purple)
        drawSmallStations(name: "Обводный канал",x: 236,y: 440, color: .purple, id: 46)
        drawSmallStations(name: "Волховская",x: 236,y: 510, color: .purple, id: 47)
        drawSmallStations(name: "Бухарестская",x: 236,y: 540, color: .purple, id: 48)
        drawSmallStations(name: "Международная",x: 236,y: 570, color: .purple, id: 49)
        drawSmallStations(name: "Проспект Славы",x: 236,y: 600, color: .purple, id: 50)
        drawSmallStations(name: "Дунайская",x: 236,y: 630, color: .purple, id: 51)
        drawSmallStations(name: "Шушары",x: 236,y: 660, color: .purple, id: 52)
        // рисуем зеленую ветку - станции
        drawSmallStations(name: "Беговая",x: 10,y: 224, color: .green, id: 53)
        drawSmallStations(name: "Зенит",x: 20,y: 244, color: .green, id: 54)
        drawSmallStations(name: "Приморская",x: 30,y: 266, color: .green, id: 55)
        drawSmallStations(name: "Василеостровская",x: 40,y: 288, color: .green, id: 56)
        drawBigStations(name: "",x: 155, y: 294, color: .green, id: 57)
        drawLabelMin(name: "Гостиный двор", x: 105, y: 294, color: .green)
        drawBigStations(name: "", x: 245, y: 294, color: .green, id: 58)
        drawLabelMin(name: "Маяковская", x: 320, y: 294, color: .green)
        drawBigStations(name: "", x: 295, y: 375, color: .green, id: 59)
        drawLabel(name: "Площадь Александра Невского 1", x: 320, y: 375, color: .green)
        drawSmallStations(name: "Елизаровская",x: 300,y: 560, color: .green, id: 60)
        drawSmallStations(name: "Ломоносовская",x: 300,y: 590, color: .green, id: 61)
        drawSmallStations(name: "Пролетарская",x: 300,y: 620, color: .green, id: 62)
        drawSmallStations(name: "Обухово",x: 300,y: 650, color: .green, id: 63)
        drawSmallStations(name: "Рыбацкое",x: 300,y: 680, color: .green, id: 64)
        // рисуем оранжевую ветку - станции
        drawBigStations(name: "",x: 155, y: 344, color: .orange, id: 65)
        drawLabel(name: "Спасская", x: 108, y: 357, color: .orange)
        drawBigStations(name: "", x: 235, y: 344, color: .orange, id: 66)
        drawLabel(name: "Достоевская", x: 310, y: 344, color: .orange)
        drawSmallStations(name: "",x: 265,y: 375, color: .orange, id: 67)
        drawLabel(name: "Лиговский проспект", x: 210, y: 370, color: .orange)
        drawBigStations(name: "", x: 295, y: 375, color: .orange, id: 68)
        drawLabel(name: "Площадь Александра Невского 2", x: 320, y: 410, color: .orange)
        drawSmallStations(name: "Новочеркасская",x: 310,y: 450, color: .orange, id: 69)
        drawSmallStations(name: "Ладожская",x: 310,y: 480, color: .orange, id: 70)
        drawSmallStations(name: "Проспект Большевиков",x: 310,y: 500, color: .orange, id: 71)
        drawSmallStations(name: "Дыбенко",x: 310,y: 540, color: .orange, id: 72)
        
        
        
        // рисуем синюю ветку - пути
        let edgeBlue = UIBezierPath()
        edgeBlue.move(to: CGPoint(x: 165,y: 26))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 54))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 84))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 114))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 144))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 174))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 224))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 254)) // Горьковская
        edgeBlue.addLine(to: CGPoint(x: 165,y: 294))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 344))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 450))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 480))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 510))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 540))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 570))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 600))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 630))
        edgeBlue.addLine(to: CGPoint(x: 165, y: 660))
            UIColor.blue.setFill()
            UIColor.blue.setStroke()
        edgeBlue.lineWidth = 4.0
        edgeBlue.stroke()
        // рисуем красную ветку - пути
        let edgeRed = UIBezierPath()
        edgeRed.move(to: CGPoint(x: 255,y: 52))
        edgeRed.addLine(to: CGPoint(x: 255,y: 80))
        edgeRed.addLine(to: CGPoint(x: 255,y: 110))
        edgeRed.addLine(to: CGPoint(x: 255,y: 140))
        edgeRed.addLine(to: CGPoint(x: 255,y: 170))
        edgeRed.addLine(to: CGPoint(x: 255,y: 200))
        edgeRed.addLine(to: CGPoint(x: 255,y: 220))
        edgeRed.addLine(to: CGPoint(x: 255,y: 240))
        edgeRed.addLine(to: CGPoint(x: 255,y: 260))
        edgeRed.addLine(to: CGPoint(x: 255,y: 305)) // Площадь Восстания
        edgeRed.addLine(to: CGPoint(x: 247,y: 350)) // Владимирская
        edgeRed.addLine(to: CGPoint(x: 225,y: 410)) // Пушкинская
        edgeRed.addLine(to: CGPoint(x: 160,y: 465)) // Техн инст 1
        edgeRed.addLine(to: CGPoint(x: 85,y: 490)) // Балтийская
        edgeRed.addLine(to: CGPoint(x: 85,y: 510))
        edgeRed.addLine(to: CGPoint(x: 85,y: 535))
        edgeRed.addLine(to: CGPoint(x: 85,y: 570))
        edgeRed.addLine(to: CGPoint(x: 85,y: 600))
        edgeRed.addLine(to: CGPoint(x: 85,y: 630))
        UIColor.red.setFill()
        UIColor.red.setStroke()
        edgeRed.lineWidth = 4.0
        edgeRed.stroke()
        // рисуем фиолетовую ветку - пути
        let edgePurple = UIBezierPath()
        edgePurple.move(to: CGPoint(x: 85, y: 122))
        edgePurple.addLine(to: CGPoint(x: 85, y: 150))
        edgePurple.addLine(to: CGPoint(x: 85, y: 170))
        edgePurple.addLine(to: CGPoint(x: 85, y: 190))
        edgePurple.addLine(to: CGPoint(x: 85, y: 215)) // Спортивная
        edgePurple.addLine(to: CGPoint(x: 125, y: 325)) // адмиралтейская
        edgePurple.addLine(to: CGPoint(x: 160, y: 350)) // садовая
        edgePurple.addLine(to: CGPoint(x: 220, y: 405)) // Звенигородская
        edgePurple.addLine(to: CGPoint(x: 241, y: 442)) // Обводный канал
        edgePurple.addLine(to: CGPoint(x: 241, y: 510))
        edgePurple.addLine(to: CGPoint(x: 241, y: 540))
        edgePurple.addLine(to: CGPoint(x: 241, y: 570))
        edgePurple.addLine(to: CGPoint(x: 241, y: 600))
        edgePurple.addLine(to: CGPoint(x: 241, y: 630))
        edgePurple.addLine(to: CGPoint(x: 241, y: 660)) // шушары
        UIColor.purple.setFill()
        UIColor.purple.setStroke()
        edgePurple.lineWidth = 4.0
        edgePurple.stroke()
        // рисуем зеленую ветку - пути
        let edgeGreen = UIBezierPath()
        edgeGreen.move(to: CGPoint(x: 13, y: 226)) // Беговая
        edgeGreen.addLine(to: CGPoint(x: 22, y: 244))
        edgeGreen.addLine(to: CGPoint(x: 33, y: 266))
        edgeGreen.addLine(to: CGPoint(x: 45, y: 294))
        edgeGreen.addLine(to: CGPoint(x: 160, y: 303))
        edgeGreen.addLine(to: CGPoint(x: 255, y: 303)) // Маяковская
        edgeGreen.addLine(to: CGPoint(x: 305, y: 380))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 560)) // елизаровская
        edgeGreen.addLine(to: CGPoint(x: 305, y: 590))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 620))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 650))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 680)) // рыбацкое
        UIColor.green.setFill()
        UIColor.green.setStroke()
        edgeGreen.lineWidth = 4.0
        edgeGreen.stroke()
        // рисуем оранжевую ветку - пути
        let edgeOrange = UIBezierPath()
        edgeOrange.move(to: CGPoint(x: 160, y: 354)) // Спасская
        edgeOrange.addLine(to: CGPoint(x: 245, y: 354)) // Достоевская
        edgeOrange.addLine(to: CGPoint(x: 270, y: 380)) // Лиговский проспект
        edgeOrange.addLine(to: CGPoint(x: 305, y: 385)) // площадь Ал Невского 2
        edgeOrange.addLine(to: CGPoint(x: 315, y: 450))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 480))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 500))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 540))
        UIColor.orange.setFill()
        UIColor.orange.setStroke()
        edgeOrange.lineWidth = 4.0
        edgeOrange.stroke()
    }
    
}
