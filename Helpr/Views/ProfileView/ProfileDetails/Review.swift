//
//  Review.swift
//  helpR
//
//  Created by Hazmil HASBULLAH on 21/09/2021.
//

import SwiftUI

struct Review: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Avis")
                .font(.largeTitle)
            Spacer()
            VStack(alignment: .leading){
                Text("Efficacité   \t⭐️⭐️⭐️⭐️⭐️").font(.largeTitle)
                Text("À l'écoute   \t⭐️⭐️⭐️⭐️").font(.largeTitle)
                Text("Critère ...   \t⭐️⭐️⭐️").font(.largeTitle)
            }
            Spacer()
        }.padding()
    }
}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        Review()
    }
}

