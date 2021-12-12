//
//  FeedViewController.swift
//  igg
//
//  Created by 황지웅 on 2021/12/13.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
    }


}

private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Instagram"
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = uploadButton
    }
}
