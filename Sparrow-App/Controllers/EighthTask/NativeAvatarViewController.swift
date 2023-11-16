//
//  NativeAvatarViewController.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 16.11.2023.
//


import UIKit

final class NativeAvatarViewController: UIViewController {
    
    
    private lazy var avatarView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle.fill")
        view.tintColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let typeView =  NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        guard let view = navigationController?.navigationBar.subviews.first(where: { subview in
            subview.isKind(of: typeView)
        }) else { return }
        view.addSubview(avatarView)
        NSLayoutConstraint.activate([
            avatarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            avatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            avatarView.widthAnchor.constraint(equalToConstant: 36),
            avatarView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    override func viewWillDisappear(_ animated: Bool) {
        avatarView.removeFromSuperview()
    }
    
}
/*
 import UIKit


 open class NativeAvatarNavigationController: UINavigationController, UINavigationControllerDelegate {
     
     let avatarImage = UIImageView()
     
     open override func viewDidLoad() {
         super.viewDidLoad()
         title = "Avatar"
         navigationBar.prefersLargeTitles = true
         view.backgroundColor = .white
         avatarImage.image = .init(systemName: "person.crop.circle.fill")
         avatarImage.contentMode = .scaleAspectFit
         avatarImage.tintColor = .systemGray3
         
         delegate = self
     }
     
     public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
         let navbar = navigationBar
         navbar.subviews.forEach { subview in
             let stringFromClass = NSStringFromClass(subview.classForCoder)
             guard stringFromClass.contains("UINavigationBarLargeTitleView") else { return }
             
             if avatarImage.superview != subview {
                 avatarImage.removeFromSuperview()
                 subview.addSubview(avatarImage)
             }
             avatarImage.translatesAutoresizingMaskIntoConstraints = false
             avatarImage.removeConstraints(avatarImage.constraints)
             
             avatarImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
             avatarImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
             avatarImage.bottomAnchor.constraint(equalTo: avatarImage.superview!.bottomAnchor, constant: -10).isActive = true
             avatarImage.trailingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
             
         }
     }
     
 }
 final class NativeAvatarViewController: UIViewController {
     private lazy var scrollView: UIScrollView = {
         let view = UIScrollView()
         view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     override func viewDidLoad() {
         super.viewDidLoad()
         title = "Avatar"
         navigationController?.navigationBar.prefersLargeTitles = true
         view.backgroundColor = .white
         view.addSubview(scrollView)
         NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
             scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         
     }
 }

 */
