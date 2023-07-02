//
//  UserListViewModel.swift
//  Githablu
//
//  Created by Rezaul Islam on 28/6/23.
//

import Foundation


final class UserListViewModel : ObservableObject{

    @Inject var net : NetWork
    @Published var users : [UserModel] = []
    
//    init() {
//        getUsers()
//    }
    
    
    
    func getUsers(){
        
        net.getDataList(from: "users", completed: { (result: Result<[UserModel], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    // Process the users array
                    print("Success \(users)")
                    self.users = users
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                }
            }
        })
        
    }
    
}
