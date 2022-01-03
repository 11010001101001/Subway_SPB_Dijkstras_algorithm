import UIKit


final class BezierCurves: UIView {
    
    // MARK: weights arrays from 1 to 72nd station - real data  from yandex maps in minutes
    lazy var weightStoreBlueLine : [Int] = [5,4,5,5,5,6,4,6,4,4,4,5,4,4,5,7,5]
    lazy var weightStoreRedLine: [Int] = [6,4,4,5,5,5,5,5,4,4,4,4,5,6,4,5,4,6]
    lazy var weightStorePurpleLine: [Int] = [5,4,5,4,5,5,5,5,5,4,5,5,6,6]
    lazy var weightStoreGreenLine: [Int] = [6,5,5,6,5,6,5,6,6,4,4]
    lazy var weightStoreOrangeLine: [Int] = [5,5,5,4,4,5,6]
    // MARK: stations arrays devided on lines
    lazy var blueStationsArr: [Station] = []
    lazy var redStationsArr: [Station] = []
    lazy var purpleStationsArr: [Station] = []
    lazy var greenStationsArr: [Station] = []
    lazy var orangeStationsArr: [Station] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // MARK: draw blue line - stations
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
        drawBigStations(name: "Технологический институт 2",x: 155, y: 450, color: .blue, id: 11)
        drawSmallStations(name: "Фрунзенская",x: 160,y: 480, color: .blue, id: 12)
        drawSmallStations(name: "Московские ворота",x: 160,y: 510, color: .blue, id: 13)
        drawSmallStations(name: "Электросила",x: 160,y: 540, color: .blue, id: 14)
        drawSmallStations(name: "Парк Победы",x: 160,y: 570, color: .blue, id: 15)
        drawSmallStations(name: "Московская",x: 160,y: 600, color: .blue, id: 16)
        drawSmallStations(name: "Звездная",x: 160,y: 630, color: .blue, id: 17)
        drawSmallStations(name: "Купчино",x: 160,y: 660, color: .blue, id: 18)
        // MARK: draw red line - stations
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
        drawBigStations(name: "Технологический институт 1", x: 155, y: 450, color: .red, id: 31)
        drawSmallStations(name: "Балтийская",x: 80, y: 485,color: .red, id: 32)
        drawSmallStations(name: "Нарвская",x: 80, y: 510,color: .red, id: 33)
        drawSmallStations(name: "Кировский завод",x: 80, y: 535,color: .red, id: 34)
        drawSmallStations(name: "Автово",x: 80, y: 570,color: .red, id: 35)
        drawSmallStations(name: "Ленинский проспект",x: 80, y: 600,color: .red, id: 36)
        drawSmallStations(name: "Проспект Ветеранов",x: 80, y: 630,color: .red, id: 37)
        // MARK: draw purple line - stations
        drawSmallStations(name: "Комендантский проспект",x: 80,y: 120, color: .purple, id: 38)
        drawSmallStations(name: "Старая деревня",x: 80,y: 150, color: .purple, id: 39)
        drawSmallStations(name: "Крестовский остров",x: 80,y: 170, color: .purple, id: 40)
        drawSmallStations(name: "Чкаловская",x: 80,y: 190, color: .purple, id: 41)
        drawSmallStations(name: "Спортивная",x: 80,y: 210, color: .purple, id: 42)
        drawSmallStations(name: "Адмиралтейская",x: 120,y: 320, color: .purple, id: 43)
        drawBigStations(name: "Садовая",x: 155, y: 344, color: .purple, id: 44)
        drawBigStations(name: "Звенигородская", x: 215, y: 400, color: .purple, id: 45)
        drawSmallStations(name: "Обводный канал",x: 236,y: 440, color: .purple, id: 46)
        drawSmallStations(name: "Волховская",x: 236,y: 510, color: .purple, id: 47)
        drawSmallStations(name: "Бухарестская",x: 236,y: 540, color: .purple, id: 48)
        drawSmallStations(name: "Международная",x: 236,y: 570, color: .purple, id: 49)
        drawSmallStations(name: "Проспект Славы",x: 236,y: 600, color: .purple, id: 50)
        drawSmallStations(name: "Дунайская",x: 236,y: 630, color: .purple, id: 51)
        drawSmallStations(name: "Шушары",x: 236,y: 660, color: .purple, id: 52)
        // MARK: draw green line - stations
        drawSmallStations(name: "Беговая",x: 10,y: 224, color: .green, id: 53)
        drawSmallStations(name: "Зенит",x: 20,y: 244, color: .green, id: 54)
        drawSmallStations(name: "Приморская",x: 30,y: 266, color: .green, id: 55)
        drawSmallStations(name: "Василеостровская",x: 40,y: 288, color: .green, id: 56)
        drawBigStations(name: "Гостиный двор",x: 155, y: 294, color: .green, id: 57)
        drawBigStations(name: "Маяковская", x: 245, y: 294, color: .green, id: 58)
        drawBigStations(name: "Площадь Александра Невского 1", x: 295, y: 375, color: .green, id: 59)
        drawSmallStations(name: "Елизаровская",x: 300,y: 560, color: .green, id: 60)
        drawSmallStations(name: "Ломоносовская",x: 300,y: 590, color: .green, id: 61)
        drawSmallStations(name: "Пролетарская",x: 300,y: 620, color: .green, id: 62)
        drawSmallStations(name: "Обухово",x: 300,y: 650, color: .green, id: 63)
        drawSmallStations(name: "Рыбацкое",x: 300,y: 680, color: .green, id: 64)
        // MARK: draw orange line - stations
        drawBigStations(name: "Спасская",x: 155, y: 344, color: .orange, id: 65)
        drawBigStations(name: "Достоевская", x: 235, y: 344, color: .orange, id: 66)
        drawSmallStations(name: "Лиговский проспект",x: 265,y: 375, color: .orange, id: 67)
        drawBigStations(name: "Площадь Александра Невского 2", x: 295, y: 375, color: .orange, id: 68)
        drawSmallStations(name: "Новочеркасская",x: 310,y: 450, color: .orange, id: 69)
        drawSmallStations(name: "Ладожская",x: 310,y: 480, color: .orange, id: 70)
        drawSmallStations(name: "Проспект Большевиков",x: 310,y: 500, color: .orange, id: 71)
        drawSmallStations(name: "Дыбенко",x: 310,y: 540, color: .orange, id: 72)
        
        // MARK: draw blue line itself
        let edgeBlue = UIBezierPath()
        edgeBlue.move(to: CGPoint(x: 165,y: 26))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 54))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 84))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 114))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 144))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 174))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 224))
        edgeBlue.addLine(to: CGPoint(x: 165,y: 254))
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
        // MARK: draw red line itself
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
        edgeRed.addLine(to: CGPoint(x: 255,y: 305))
        edgeRed.addLine(to: CGPoint(x: 247,y: 350))
        edgeRed.addLine(to: CGPoint(x: 225,y: 410))
        edgeRed.addLine(to: CGPoint(x: 160,y: 465))
        edgeRed.addLine(to: CGPoint(x: 85,y: 490))
        edgeRed.addLine(to: CGPoint(x: 85,y: 510))
        edgeRed.addLine(to: CGPoint(x: 85,y: 535))
        edgeRed.addLine(to: CGPoint(x: 85,y: 570))
        edgeRed.addLine(to: CGPoint(x: 85,y: 600))
        edgeRed.addLine(to: CGPoint(x: 85,y: 630))
        UIColor.red.setFill()
        UIColor.red.setStroke()
        edgeRed.lineWidth = 4.0
        edgeRed.stroke()
        // MARK: draw purple line itself
        let edgePurple = UIBezierPath()
        edgePurple.move(to: CGPoint(x: 85, y: 122))
        edgePurple.addLine(to: CGPoint(x: 85, y: 150))
        edgePurple.addLine(to: CGPoint(x: 85, y: 170))
        edgePurple.addLine(to: CGPoint(x: 85, y: 190))
        edgePurple.addLine(to: CGPoint(x: 85, y: 215))
        edgePurple.addLine(to: CGPoint(x: 125, y: 325))
        edgePurple.addLine(to: CGPoint(x: 160, y: 350))
        edgePurple.addLine(to: CGPoint(x: 220, y: 405))
        edgePurple.addLine(to: CGPoint(x: 241, y: 442))
        edgePurple.addLine(to: CGPoint(x: 241, y: 510))
        edgePurple.addLine(to: CGPoint(x: 241, y: 540))
        edgePurple.addLine(to: CGPoint(x: 241, y: 570))
        edgePurple.addLine(to: CGPoint(x: 241, y: 600))
        edgePurple.addLine(to: CGPoint(x: 241, y: 630))
        edgePurple.addLine(to: CGPoint(x: 241, y: 660))
        UIColor.purple.setFill()
        UIColor.purple.setStroke()
        edgePurple.lineWidth = 4.0
        edgePurple.stroke()
        // MARK: draw green line itself
        let edgeGreen = UIBezierPath()
        edgeGreen.move(to: CGPoint(x: 13, y: 226)) // Беговая
        edgeGreen.addLine(to: CGPoint(x: 22, y: 244))
        edgeGreen.addLine(to: CGPoint(x: 33, y: 266))
        edgeGreen.addLine(to: CGPoint(x: 45, y: 294))
        edgeGreen.addLine(to: CGPoint(x: 160, y: 303))
        edgeGreen.addLine(to: CGPoint(x: 255, y: 303))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 380))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 560))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 590))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 620))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 650))
        edgeGreen.addLine(to: CGPoint(x: 305, y: 680))
        UIColor.green.setFill()
        UIColor.green.setStroke()
        edgeGreen.lineWidth = 4.0
        edgeGreen.stroke()
        // MARK: draw orange line itself
        let edgeOrange = UIBezierPath()
        edgeOrange.move(to: CGPoint(x: 160, y: 354))
        edgeOrange.addLine(to: CGPoint(x: 245, y: 354))
        edgeOrange.addLine(to: CGPoint(x: 270, y: 380))
        edgeOrange.addLine(to: CGPoint(x: 305, y: 385))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 450))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 480))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 500))
        edgeOrange.addLine(to: CGPoint(x: 315, y: 540))
        UIColor.orange.setFill()
        UIColor.orange.setStroke()
        edgeOrange.lineWidth = 4.0
        edgeOrange.stroke()
        
        //  MARK: let's hide lines crossings
        hide(165, 352, 7)
        hide(165, 303, 5)
        hide(165, 459, 5)
        hide(255, 303, 5)
        hide(245, 355, 5)
        hide(305, 384, 5)
        hide(224, 409, 5)
        
        // MARK: create graph and edges
        if Singleton.allVertexes.count == 72 {
            createGraph()
        }
    }
    func hide(_ x: Int,_ y: Int,_ radius: CGFloat) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: x, y: y),
                                      radius: radius,
                                      startAngle: 0,
                                      endAngle: CGFloat(Double.pi*2),
                                      clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        UIColor.white.setFill()
        UIColor.darkGray.setStroke()
        circlePath.lineWidth = 2.0
        circlePath.fill()
        circlePath.stroke()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        for view in subviews {
            if view.frame.contains(point) && view.tag != 0 && !Singleton.pathWay.contains(view.tag) {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: .curveEaseIn,
                               animations: { 
                    view.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                    Singleton.pathWay.append(view.tag)
                }, completion: { finished in
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut,
                                   animations: {
                        view.transform = .identity
                    })
                })
            }
        }
        return true
    }
}
