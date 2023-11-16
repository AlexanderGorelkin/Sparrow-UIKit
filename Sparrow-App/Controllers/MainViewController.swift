//
//  MainViewController.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 14.11.2023.
//

import UIKit



fileprivate enum Controllers: String {
    case firstTask
    case secondTask
    case thirdTask
    case fourhTask
    case fifthTask
    case sixthTask
    case seventhTask
    case eighthTask
    case ninthTask
    static let allValues = [firstTask, secondTask, thirdTask, fourhTask, fifthTask, sixthTask, seventhTask, eighthTask, ninthTask]
    func getController() -> UIViewController{
        switch self {
        case .firstTask:
            GradientViewController()
        case .secondTask:
            ThreeButtonViewController()
        case .thirdTask:
            RelatedAnimationViewController()
        case .fourhTask:
            MixerTableViewController()
        case .fifthTask:
            CompactViewController()
        case .sixthTask:
            InertialSquareViewController()
        case .seventhTask:
            StretchablePictureViewController()
        case .eighthTask:
            NativeAvatarViewController()
        case .ninthTask:
            CarringCollectionViewController()
        }
    }
    
    func getName() -> String {
        switch self {
        case .firstTask: "Градиент и тень"
        case .secondTask:
            "Три кнопки"
        case .thirdTask:
            "Связанная анимация"
        case .fourhTask:
            "Миксер таблица"
        case .fifthTask:
            "Компактный контроллер"
        case .sixthTask:
            "Инерционный квадрат"
        case .seventhTask:
            "Рстягивающаяся картинка"
        case .eighthTask:
            "Нативный аватар"
        case .ninthTask:
            "Заботливая коллекция"
        }
    }
}
final class MainViewController: UIViewController {
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Controllers.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = Controllers.allValues[indexPath.row].getName()
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = Controllers.allValues[indexPath.row].getController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
