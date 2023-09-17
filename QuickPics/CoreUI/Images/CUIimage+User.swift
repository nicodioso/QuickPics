//
//  CUIimage+User.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

struct UserImage: View {

    let urlString: String
    /// Both `width` and `height`are set. (1:1 proportion)
    var size: CGFloat
    
    var body: some View {
        CUIImage.Url(string: urlString)
            .frame(width: size, height: size)
            .mask(Circle().padding(3))
            .background(Circle().fill(Color.white))
    }
}
