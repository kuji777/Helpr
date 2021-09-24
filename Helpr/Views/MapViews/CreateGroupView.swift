//
//  CreateGroupView.swift
//  Helpr
//
//  Created by Vincent Qian on 23/09/2021.
//
// mode de transport
//
import SwiftUI

struct CreateGroupView: View {
    
    @State private var destination : String = ""
    @State private var departure : String = ""
    
    @State var isVerifiedPeople = true
    @State var isOnlyWomen = false
    @State var isOnlyMan = false

    @State private var selectedTransport: Int = 0
    private var transportOption = ["🚲 Vélo", "🚶‍♀️ Pieton", "🚗 Voiture", "🚇 Transports en communs"]

        
    var body: some View {
        
        NavigationView {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.1)
        VStack{
            Image(systemName: "figure.wave.circle")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                //.padding(.bottom)
                .padding(.top, 60)
            Form {
            Text("Je part de :")
                .font(.title2)
            TextField("Depart ...", text: $departure)
                .font(.title3)
                .padding(10)
            Text("Je me dirige vers :")
                .font(.title2)
            TextField("Destination ...", text: $destination)
                .font(.title3)
                .padding(10)
            //Text("Options").font(.title)
                
             Picker("Mode de transport", selection: $selectedTransport) {
                    ForEach(0..<transportOption.count){
                        Text(self.transportOption[$0])
                    }
                }
            
            OptionsToggle(texte: "Personnes vérifiés", trueFalse: $isVerifiedPeople)
            OptionsToggle(texte: "Exclusivement féminin", trueFalse: $isOnlyWomen)
            OptionsToggle(texte: "Exclusivement masculin", trueFalse: $isOnlyMan)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Spacer()
                    VStack {
                        Text("Créer le groupe")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }.padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.top, 20)
                    Spacer()
                }
            })
            }
        }.padding(.bottom, 14)
        }.ignoresSafeArea()
    }
  }
}
struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
struct OptionsToggle: View {
    var texte: String
    @Binding var trueFalse: Bool
    var body: some View {
        Toggle(isOn: $trueFalse, label: {
            Text(texte)
                .font(.system(size: 20))
        }).padding(10)
    }
}
