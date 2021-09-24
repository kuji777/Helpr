//
//  Language.swift
//  helpR
//
//  Created by Hazmil HASBULLAH on 21/09/2021.
//

import SwiftUI

struct Language: View {
    var body: some View {
        VStack {
            FlagIcon(flag: "🇨🇳")
            FlagIcon(flag: "🇫🇷")
            FlagIcon(flag: "🇺🇸")
            FlagIcon(flag: "🇷🇺")

        }
    }
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language()
    }
}

struct FlagIcon: View {
    var flag: String
    
    var body: some View {
        Text(flag).font(.largeTitle)
    }
}
