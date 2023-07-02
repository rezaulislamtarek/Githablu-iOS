//
//  UserDetailsViewModel.swift
//  Githablu
//
//  Created by Rezaul Islam on 1/7/23.
//

import Foundation

final class UserDetailsViewModel : ObservableObject {
    @Inject var network  : NetWork
    @Published var user : UserModel = UserModel()

    

    
    func getUserDetails(userName : String){
        network.getDataObject(from: "users/"+userName, completed: {
            (result: Result<UserModel, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print("SuccessDetails \(data)")
                    self.user = data
                case .failure(let error):
                    print("Error \(error)")
                }
            }
        })
    }
    
}


