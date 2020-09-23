//
//  ViewController.swift
//  DDE
//
//  Created by iljoo Chae on 9/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticated()
//        do {
//                try Auth.auth().signOut()
//        }catch{
//            print("Failed to signout")
//        }
//        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    private func handleNotAuthenticated() {
        //Check auth status
        if Auth.auth().currentUser == nil {
            //show log in page
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}

