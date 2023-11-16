//
//  GradientViewController.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 14.11.2023.
//

import UIKit


final class GradientViewController: UIViewController {
    
    lazy var cyanView = GradientView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cyanView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cyanView.frame = .init(x: 100, y: cyanView.frame.origin.y, width: 120, height: 120)
        cyanView.center.y = view.frame.height / 2
    }
    
}

