//
//  keyboard.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI

/// Class keyboard will make the text fields to shift up and not cover them when its active
class Keyboard: ObservableObject {
    @Published var frame = CGRect()
    var x: Int { Int(frame.origin.x) }
    var y: Int { Int(frame.origin.y) }
    var w: Int { Int(frame.size.width) }
    var h: Int { Int(frame.size.height) }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
        name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)),
        name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        guard let rect = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect
            else { return }
        frame = rect
    }
    
    @objc func keyboardDidHide(notification: Notification) {
        frame = .zero
    }
    
}



