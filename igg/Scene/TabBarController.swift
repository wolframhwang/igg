//
//  TabBarController.swift
//  igg
//
//  Created by 황지웅 on 2021/12/13.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이 타이밍에 탭바 컨트롤..
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        // Tab Bar Item이 설정이 안되어있으면 안됌
        viewControllers = [feedViewController, profileViewController]
    }
}
