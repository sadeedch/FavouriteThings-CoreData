//
//  Image.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation

import SwiftUI

/// function name: downloadedImage
/// - Parameter img: Accepts a string parameter and returns an image as downloadedImage.
func downloadedImage (_ img: String)-> Image {

    //  This guard checks that if the url entered is correct otherwise it retruns the default image.
    guard let imageURL = URL(string: img )
        else {
            return (Image("default"))
    }

    /*  This guard checks that if the data can be derived from the given url, otherwise it retruns a print statement of
        that it could not download the image and default image is displayed to the user.
    */
    guard let imageData = try? Data(contentsOf: imageURL)
        else {
            print("Could not download the image")
            return (Image("default"))
    }

    /*  This guard checks that if an image can be created from the image data. If not, then it returns a print
        statement that Data does not contain any image and the default image is displayed to the user.
    */
    guard let uiImage = UIImage(data: imageData) else {
            print("Data does not contain any image")
            return (Image("default"))
    }

    // UIImage data is converted to the Image and stored in the downloadedImage.
    let downloadedImage = Image(uiImage: uiImage)
    
    // returns the downloaded Image
    return downloadedImage
}
