//
//  SafePointDetailsView.swift
//  Helpr
//
//  Created by Vincent Qian on 17/09/2021.
//

import SwiftUI

struct SafePointDetailsView: View {
    
    var safePoint : SafePoint
    
    var body: some View {
        ZStack {
        VStack{
                Text(safePoint.name)
                    .font(.title)
                    .padding(.vertical)
                    
            Image(safePoint.images[0])
                .resizable()
                .frame(width: 375, height: 250, alignment: .center)
                .cornerRadius(20)
                .padding()
            HStack {
                Button(action: {
                    // $$$ APPEL DU NUMERO $$$
                }, label: {
                    VStack {
                        Image(systemName: "phone.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(10)
                        Text("Appeler")
                            .foregroundColor(.white)
                            .padding(1)
                    }.padding(.horizontal)
                    .background(Color.green)
                    .cornerRadius(12)
                    .shadow(radius: 3)
                })
                Spacer()
                Button(action: {
                    // $$$ MONTRER LE CHEMIN SUR LA CARTE
                }, label: {
                    VStack {
                        Image(systemName: "arrow.turn.up.right")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(10)
                        Text("Rejoindre")
                            .foregroundColor(.white)
                            .padding(1)
                    }.padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .shadow(radius: 3)
                })
                Spacer()
                Button(action: {
                    // $$$ LANCER LA NAVIGATION VERS LE POINT 
                }, label: {
                    VStack {
                        Image(systemName: "location.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(10)
                        Text("Localiser")
                            .foregroundColor(.white)
                            .padding(1)
                    }.padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .shadow(radius: 3)
                })
            }.padding(.horizontal, 25).padding(.vertical,20)
            HStack{
                VStack(alignment: .leading) {
                    Text("Infos :")
                        .font(.title)
                        .underline()
                    Text(safePoint.phoneNumber)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.vertical, 5)
                    Text(safePoint.adress)
                        .font(.title3)
                        .foregroundColor(.gray)
                }.padding()
                Spacer()
            }.padding(.horizontal, 18)
        }
        }.ignoresSafeArea()
    }
}

struct SafePointDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SafePointDetailsView(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]))
    }
}
