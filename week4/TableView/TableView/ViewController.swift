//
//  ViewController.swift
//  TableView
//
//  Created by Astrid on 2021/8/17.
//

import UIKit

class ViewController: UIViewController {
    
lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
    table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.rowHeight = 118
        table.estimatedRowHeight = 0
        table.allowsSelection = false
        table.bounces = false
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraints()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setupConstraints()
    }
   
   private func setupConstraints(){
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
        ])
    }
}

//MARK:- UITableView DataSource

extension  ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.configureLabel()
        cell.label.text = "This is section \(indexPath.section), row\(indexPath.row)"
        
        return cell
    }
}

