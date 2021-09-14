//
//  Image+Extension.swift
//  ThingsTodo
//
//  Created by PremierSoft on 13/09/21.
//

import SwiftUI

extension Image {
    static let plusIcon = AnyView(Image(systemName: "plus").accentColor(.white))
    static let emptyIcon = AnyView(Image("EmptyIcon").accentColor(.white))
    static let checkedBoxIcon = AnyView(Image("CheckedBoxIcon")
                                            .renderingMode(.template)
                                            .resizable()
                                            .accentColor(.primaryColor))
    static let emptyBoxIcon = AnyView(Image("EmptyBoxIcon")
                                        .renderingMode(.template)
                                        .resizable()
                                        .accentColor(.primaryColor))
}
