//
//  UserDetailsView.swift
//  Githablu
//
//  Created by Rezaul Islam on 1/7/23.
//

import SwiftUI

struct UserDetailsView: View {
    var userName : String
    @StateObject var vm = UserDetailsViewModel()
    
    var body: some View {
        VStack {
            if vm.user.avatar_url != nil{
                UrlImageView(urlString: vm.user.avatar_url!)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(30)
                    .padding()
                
            }
            Text(vm.user.name ?? "")
                .foregroundColor(.black)
                .font(.title)
                .padding()
            if vm.user.company != nil{
                Text("Worked at \(vm.user.company!)")
                    .padding(.vertical, 5)
            }
            Text(vm.user.bio ?? "")
                .padding(.horizontal,20)
            
            
        }.onAppear{
            vm.getUserDetails(userName: userName)
        }
        
        
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(userName: "abc")
    }
}
