//
//  ViewController.swift
//  Spotify
//
//  Created by Dmytro Ivanenko on 23.03.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(didTapEttings)
        )
    }
    
    @objc func didTapEttings() {
        let vc = ProfileViewController()
        vc.title = "Prpfile"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}

