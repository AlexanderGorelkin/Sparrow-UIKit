//
//  GradientView.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 14.11.2023.
//

import UIKit

final class GradientView: UIView {
    let gradientLayer = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        // MARK:  SETUP CORNERS
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        
        // MARK:  SETUP SHADOW
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: .zero, height: 12)
        layer.shadowRadius = 12
        
        // MARK:  SETUP GRADIENT LAYER
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.systemRed.withAlphaComponent(0.1), UIColor.systemRed.cgColor]
        layer.addSublayer(gradientLayer)
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if layer == self.layer {
            gradientLayer.frame = bounds
            gradientLayer.cornerRadius = layer.cornerRadius
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
