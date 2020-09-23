//
//  DatabaseManager.swift
//  DDE
//
//  Created by iljoo Chae on 9/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    //MARK: - public
    
    ///Check if usernbanme and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreaeNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    ///Inserts new user data to database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        print(key)
        
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                //success
                completion(true)
                return
            }else{
                //failed
                completion(false)
                return
            }
        }
    }

    //MARK - Private
    
    
}
