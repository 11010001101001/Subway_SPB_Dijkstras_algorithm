//
//  BezierCurves.swift
//  AnalogMetroSpb
//
//  Created by Admin on 17.08.2021.
//

import UIKit

class BezierCurves: UIView {

    override func draw(_ rect: CGRect) {
        // рисуем синюю ветку
        let edgeBlue = UIBezierPath()
        edgeBlue.move(to: CGPoint(x: 165,y: 24))
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
//        edgeBlue.close()
            UIColor.blue.setFill()
            UIColor.blue.setStroke()
        edgeBlue.lineWidth = 3.0
//        edgeBlue.fill()
        edgeBlue.stroke()
        // рисуем красную ветку
        let edgeRed = UIBezierPath()
        edgeRed.move(to: CGPoint(x: 255,y: 50))
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
        edgeRed.addLine(to: CGPoint(x: 85,y: 485)) // Балтийская
        edgeRed.addLine(to: CGPoint(x: 85,y: 510))
        edgeRed.addLine(to: CGPoint(x: 85,y: 535))
        edgeRed.addLine(to: CGPoint(x: 85,y: 570))
        edgeRed.addLine(to: CGPoint(x: 85,y: 600))
        edgeRed.addLine(to: CGPoint(x: 85,y: 630))
//        edgeRed.close()
        UIColor.red.setFill()
        UIColor.red.setStroke()
        edgeRed.lineWidth = 3.0
//        edgeRed.fill()
        edgeRed.stroke()
        // рисуем фиолетовую ветку
        let edgePurple = UIBezierPath()
        edgePurple.move(to: CGPoint(x: 85, y: 120))
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
        edgePurple.lineWidth = 3.0
        edgePurple.stroke()
        // рисуем зеленую ветку
        
    }
    
    
}
