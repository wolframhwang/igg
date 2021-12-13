//
//  ProfileViewController.swift
//  igg
//
//  Created by 황지웅 on 2021/12/13.
//

import Foundation
import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor//옅은 회색!
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("메세지", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        
        return button
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("팔로우", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 3.0
        return button
    }()
    
    
    private let photoDataView = ProfileDatView(title: "게시물", count: 123)
    
    private let followerDataView = ProfileDatView(title: "팔로워", count: 2333)
    private let followingDataView = ProfileDatView(title: "팔로잉", count: 10)
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        setupLayout()
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width / 3) - 2
        
        return CGSize(width: width, height: width)
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell
        cell?.setup(with: UIImage())
        return cell ?? UICollectionViewCell()
    }
}
private  extension ProfileViewController {
    func setNavigationItems() {
        navigationItem.title = "UserName"
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func didTapRightBarButtonItem() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        [
            UIAlertAction(title: "정보 변경", style: .default) { make in
                print("정보 변경!! \(make)")
            },
            UIAlertAction(title: "탈퇴 하기", style: .destructive),
            UIAlertAction(title: "닫기", style: .cancel)
        ].forEach { actionSheet.addAction($0) }
        
        present(actionSheet, animated: true)
    }
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [followButton, messageButton])
        buttonStackView.spacing = 4.0
        buttonStackView.distribution = .fillEqually
        
        let dataStackView = UIStackView(arrangedSubviews: [ photoDataView, followerDataView, followingDataView])
        dataStackView.spacing = 4.0
        dataStackView.distribution = .fillEqually
        
        [
            profileImageView, dataStackView, nameLabel, descriptionLabel, buttonStackView, collectionView
        ].forEach { view.addSubview($0) }
        
        let inset: CGFloat = 16.0
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        dataStackView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            make.trailing.equalToSuperview().inset(inset)
            make.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(12.0)
            make.leading.equalTo(profileImageView.snp.leading)
            make.trailing.equalToSuperview().inset(inset)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12.0)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(nameLabel.snp.trailing)
            
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(16.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
