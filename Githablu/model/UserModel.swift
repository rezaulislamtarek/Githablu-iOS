//
//  UserModel.swift
//  Githablu
//
//  Created by Rezaul Islam on 28/6/23.
//

import Foundation

struct UserModel : Codable{
    var login: String?
    var id: Int?
    var avatar_url: String?
    var name: String?
    var bio : String?
    var company: String?
}
