//
//  ImageLoader.swift
//  Githablu
//
//  Created by Rezaul Islam on 29/6/23.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image : Image? = nil
    @Inject var network : NetWork
    func load(fromUrl url:String){
        network.downloadImage(from: url){ uiImage in
            guard let uiImage = uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
    
}

struct RemoteImage: View {
    var image: Image?
    var body: some View{
        image?.resizable() ?? Image(systemName: "photo")
    }
}

struct UrlImageView : View {
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromUrl: urlString)
            }
    }
}
