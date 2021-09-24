//
//  MapControlView.swift
//  Helpr
//
//  Created by Vincent Qian on 15/09/2021.
//

import SwiftUI

import CoreLocation

struct MapControlView: View {
   
    /// Variable booleen qui gère l'affichge de AlertView
    @State private var isAlertPresented = false
    @State private var isFilterPresented = false
    
    enum ActiveSheet: Identifiable {
        case filter, alert ,groupCreation
        
        var id: Int {
            hashValue
        }
    }
    
    @State var activeAlert: ActiveSheet?
    @State var activeSheet: ActiveSheet?
    
    /// Contient des coordonnées  de la localisation
    var coordinates: Coordinates
    
    /// Fournit une instance de CLLocationCoordinate2D avec les coordonnées de coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    var body: some View {
//        NavigationView {
            ZStack{
                MapView(coordinate: locationCoordinate)

                VStack{
                    HStack{
                        Spacer()
                        VStack {
                            Button(action: {
                                activeSheet = .filter
                                isFilterPresented.toggle()
                            },
                                   label: {
                                    Image(systemName: "line.horizontal.3.decrease.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)     .foregroundColor(.white)
                                        .padding(7)
                                        .background(Circle().opacity(0.7).foregroundColor(.black))
                                        //.padding(30)
                                        .padding(.top, 60)
                               })
                            Button(action: {
                                 activeSheet = .groupCreation
                            },
                            label: {
                                Image(systemName: "checkmark.shield")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)     .foregroundColor(.blue)
                                    .padding(7)
                                    .background(Circle().opacity(0.7).foregroundColor(.black))
                                    .padding(15)
                                    //.padding(.top, 10)
                            })
                        }
                    }
//                    HStack{
//                        Spacer()
//                        Button(action: {
//                           // activeSheet = .filter
//                            isFilterPresented.toggle()
//                        },
//                               label: {
//                                Image(systemName: "line.horizontal.3.decrease.circle")
//                                    .resizable()
//                                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)     .foregroundColor(.white)
//                                    .padding(7)
//                                    .background(Circle().opacity(0.7).foregroundColor(.black))
//                                    .padding(30)
//                                    .padding(.vertical,120)
//                        })
//                    }
                    Spacer()
                    Button(action: {
                        activeAlert = .alert
                    },
                           label: {
                            Image(systemName: "bell.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .padding()
                                .background(Circle().foregroundColor(.red))
                                .padding(.bottom,5)
                           })
                }
                .sheet(item: $activeSheet, content: { item in
                    switch item {
                    case .filter:
                        MapFilterView()
                    case .alert:
                        FastAlertView()
                    case .groupCreation:
                        CreateGroupView()
                    }
                })
                
                // on utilise la HStack pour mettre `fullscreenCover` au meme niveau que `sheet`
                HStack{}.fullScreenCover(item: $activeAlert, content: { item in
                    switch item {
                    case .filter:
                        MapFilterView()
                    case .alert:
                        FastAlertView()
                    case .groupCreation:
                        CreateGroupView()
                    }
                })
            }
            /// Appelle la vue modale AlertView en prenant tout l'écran
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//        }
        }
        
    }



struct MapControlView_Previews: PreviewProvider {
    static var previews: some View {
        MapControlView(coordinates: Coordinates(latitude: 48.866669, longitude: 2.33333))
            .previewDevice("iPhone 12")
    }
}
