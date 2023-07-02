//
//  ContentView.swift
//  Githablu
//
//  Created by Rezaul Islam on 28/6/23.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var vm = UserListViewModel()
    
  
    var body: some View {
        VStack {
            NavigationView{
                List{
                    
                    ForEach(vm.users, id: \.id){ user in
                       
                        NavigationLink(destination: UserDetailsView(userName: user.login ?? ""), label: {
                            HStack{
                                UrlImageView(urlString: user.avatar_url ?? "")
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                                
                                Text(user.login ?? "")
                            }
                        } )
                        
                    }
                    
                }.scrollIndicators(.hidden)
                    .navigationTitle("Developers")
            }.onAppear(){
                vm.getUsers()
            }
                
        }
        
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
