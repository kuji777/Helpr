//
//  FrequentItinerary.swift
//  helpR
//
//  Created by Hazmil HASBULLAH on 21/09/2021.
//

import SwiftUI

struct FrequentItinerary: View {
    var body: some View {
        VStack {
            Walking()
            Metro()
            RER()
        }
    }
}

struct FrequentItinerary_Previews: PreviewProvider {
    static var previews: some View {
        FrequentItinerary()
    }
}

struct Walking: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "figure.walk")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text("Chatelet ...... Republique")
                Text("XXX ........ YYY")
                Text("ABC ........ ZYK")

            }
        }
    }
}

struct Metro: View {
    var body: some View {
        HStack {
            Image("metro13")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Image("metro2")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RER: View {
    var body: some View {
        HStack {
            Image("rerA")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Image("rerB")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
