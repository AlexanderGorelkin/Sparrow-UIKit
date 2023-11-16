//
//  MixerTableViewController.swift
//  Sparrow-App
//
//  Created by Александр Горелкин on 15.11.2023.
//

import UIKit

final class MixerTableViewController: UIViewController, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.cornerRadius = 8
        table.delegate = self
        return table
    }()
    
    
    private lazy var dataSource: UITableViewDiffableDataSource<String, String> = {
        return UITableViewDiffableDataSource<String, String>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = itemIdentifier
            cell?.accessoryType = self.selected.contains(itemIdentifier) ? .checkmark : .none
            return cell
        }
    }()
    
    private var data: [String] = []
    private var selected: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Task 4"
        
        for i in 0...30 {
            data.append(String(i))
        }
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = .init(title: "Shuffle", primaryAction: .init(handler: { _ in
            self.updateData(self.data.shuffled(), animated: true)
        }))
        updateData(data, animated: false)
    }
    
    private func updateData(_ data: [String], animated: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["first"])
        snapshot.appendItems(data, toSection: "first")
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let item = dataSource.itemIdentifier(for: indexPath) {
            if self.selected.contains(item) {
                selected = selected.filter { $0 != item }
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                
            } else {
                selected.append(item)
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            if let first = dataSource.snapshot().itemIdentifiers.first, first != item {
                var snapshot = dataSource.snapshot()
                snapshot.moveItem(item, beforeItem: first)
                dataSource.apply(snapshot)
            }
        }
        
        
    }
    
}
