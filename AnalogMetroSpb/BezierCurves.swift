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
        edgeRed.addLine(to: CGPoint(x: 255,y: 305)) // Площадь Восстания
        edgeRed.addLine(to: CGPoint(x: 247,y: 350)) // Владимирская
        edgeRed.addLine(to: CGPoint(x: 225,y: 410)) // Пушкинская
        edgeRed.addLine(to: CGPoint(x: 160,y: 465)) // Техн инст 1
        edgeRed.addLine(to: CGPoint(x: 85,y: 485)) // Балтийская
        edgeRed.addLine(to: CGPoint(x: 85,y: 630))
//        edgeRed.close()
        UIColor.red.setFill()
        UIColor.red.setStroke()
        edgeRed.lineWidth = 3.0
//        edgeRed.fill()
        edgeRed.stroke()
    }
    
    
}
