//
//  ContentView.swift
//  Helpr
//
//  Created by Vincent Qian on 15/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var annotations = [Annotation]()
    
///     Récupérer les coordonnées depuis un fichier JSON
//    private func loadLocations() {
//
//            guard let path = Bundle.main.path(forResource: "locations", ofType: "json") else {
//                fatalError("File locations.json not found!")
//            }
//
//            guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
//
//            let annotations = try? JSONDecoder().decode([SafePointAnnotation].self, from: data)
//            if let annotations = annotations {
//                self.spAnnotations = annotations
//            }
//
//        }
    
    var body: some View {
        TabView{
            
            MapControlView(coordinates: Coordinates(latitude: 48.89, longitude: 2.33))
                .tabItem {
                    Label(
                    title: { Text("Carte") },
                    icon: { Image(systemName: "map") })
                }
            
            ContactsView()
                .tabItem {
                    Text("Conversations")
                    Image(systemName: "message")
                }
            
            ParametersView(isDispo: true, isDay: true, isLocated: true)
                .tabItem {
                Text("Parametres")
                Image(systemName: "gearshape")
                }
        
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
