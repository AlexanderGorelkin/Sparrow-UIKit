//
//  InertialSquareViewController.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 15.11.2023.
//

import UIKit
final class InertialSquareViewController: UIViewController {
    
    
    let squareView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(squareView)
        squareView.backgroundColor = .systemBlue
        squareView.layer.cornerCurve = .continuous
        squareView.layer.cornerRadius = 8
        squareView.frame = .init(x: 0, y: 0, width: 100, height: 100)
        squareView.center = .init(x: view.frame.width / 2, y: view.frame.height / 2)
        
        animator = UIDynamicAnimator(referenceView: view)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender: )))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    private var animator: UIDynamicAnimator?
    private var snapBehavior: UISnapBehavior?
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)
        
        if let snapBehavior = self.snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        let snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehavior.damping = 0.9
        animator?.addBehavior(snapBehavior)
        
        self.snapBehavior = snapBehavior
    }
    
}
