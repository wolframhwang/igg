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
    
    private lazy var imagePickerController : UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary //  iphone image 불러오기..
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        return imagePickerController
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

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택 이후.. 할것
        
        var selectImage: UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originalImage
        }
        
        print(selectImage)
        picker.dismiss(animated: true) {
            [weak self] in
                let uploadViewController = UploadViewController(uploadImage: selectImage ?? UIImage())
                let navigationController = UINavigationController(rootViewController: uploadViewController)
                navigationController.modalPresentationStyle = .fullScreen
                self?.present(navigationController, animated: true)
        }
        
    }
}
private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Instagram"
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapUploadButton))
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    @objc func didTapUploadButton() {
        // image Picker 를 Present해줘야함
        present(imagePickerController, animated: true)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview()}
    }
}
