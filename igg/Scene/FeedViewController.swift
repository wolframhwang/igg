//
//  FeedViewController.swift
//  igg
//
//  Created by 황지웅 on 2021/12/13.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none//줄 없애기
        tableView.dataSource = self
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        setupTableView()
    }


}
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
        cell?.selectionStyle = .none
        cell?.setup()
        //cell.backgroundColor = .black
        
        return cell ?? UITableViewCell()
    }
}
private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Instagram"
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview()}
    }
}
