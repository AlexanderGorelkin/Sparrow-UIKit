//
//  CustomButtonView.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 14.11.2023.
//

import UIKit
final class CustomButtonView: UIButton {
    
    override var isHighlighted: Bool {
            didSet {
                UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
                    self.transform = self.isHighlighted ? .init(scaleX: 0.9, y: 0.9) : .identity
                }, completion: nil)
            }
        }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            self.imageView?.tintColor = .systemGray3
            self.backgroundColor = .systemGray2
        } else {
            self.imageView?.tintColor = .white
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .white
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        
        // MARK:  SETUP IMAGE FOR DIFFERENT STATES
        setImage(.init(systemName: "arrow.right.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        setImage(.init(systemName: "arrow.right.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        
        tintColorDidChange()
        
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        
        
        setInsets()
        
    }
    func setInsets() {
        
        var config = UIButton.Configuration.filled()
       
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
