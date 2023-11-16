//
//  ThreeButtonViewController.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 14.11.2023.
//

import UIKit


final class ThreeButtonViewController: UIViewController {
    
    
    let firstButton = CustomButtonView(title: "First Button")
    let secondButton = CustomButtonView(title: "Second Middle Button")
    let thirdButton: CustomButtonView = {
        let button = CustomButtonView(title: "Third")
        
        button.addTarget(self, action: #selector(openController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if (firstButton.transform == .identity && secondButton.transform == .identity && thirdButton.transform == .identity) {
            firstButton.sizeToFit()
            firstButton.center.x = view.frame.width / 2
            firstButton.frame.origin.y = view.safeAreaInsets.top
            
            secondButton.sizeToFit()
            secondButton.center.x = firstButton.center.x
            secondButton.frame.origin.y = firstButton.frame.maxY + 8
            
            thirdButton.sizeToFit()
            thirdButton.center.x = secondButton.center.x
            thirdButton.frame.origin.y = secondButton.frame.maxY + 8
        }
    }
    @objc func openController(_ sender: UIButton) {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
}
