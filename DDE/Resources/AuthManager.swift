//
//  AuthManager.swift
//  DDE
//
//  Created by iljoo Chae on 9/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    //MARK: - Public
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - check if username is available
         - check if email is available
         */
        DatabaseManager.shared.canCreaeNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - Create account
                 - insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        //firebase auth could not create account
                        completion(false)
                        return
                    }
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            //failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }else{
            //either uesrname or email does not exist
            completion(false)
            }
        }
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            //email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    print("Completion: Failed")
                    return
                }
                completion(true)
            }
        }else if let username = username {
            //username login
            print(username)
        }
        
    }
}

