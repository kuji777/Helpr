//frequentItineraryDetail
//last modified : 22h43

import SwiftUI

struct FrequentItinerary: View {
    var body: some View {
        VStack {
            
            Text("Itinéraires fréquents")
                .font(.largeTitle)
            Spacer()
            Walking()
            Spacer()
            Metro()
            Spacer()
            RER()
            Spacer()
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
                .font(.system(size: 70))
            VStack(alignment: .leading) {
                Text("Châtelet >\tRepublique").font(.title2)
                Text("Point A  \t> \tPoint X").font(.title2)
                Text("Point B  \t> \tPoint Y \t> \tPoint Z").font(.title2)
            }
        }//.padding()
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
