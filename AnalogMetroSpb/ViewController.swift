//
//  ViewController.swift
//  AnalogMetroSpb
//
//  Created by Admin on 13.08.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIScrollViewDelegate {
    

    @IBOutlet weak var mapScrollView: UIScrollView!
    @IBOutlet weak var map: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapScrollView.minimumZoomScale = 1.0
        mapScrollView.maximumZoomScale = 6.0
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return map
    }
    
}


