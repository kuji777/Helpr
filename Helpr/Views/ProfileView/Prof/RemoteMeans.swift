//
//  RemoteMeans.swift
//  helpR
//
//  Created by Hazmil HASBULLAH on 21/09/2021.
//

import SwiftUI

struct RemoteMeans: View {
    var body: some View {
        VStack {
            Vehicle(vehicleName: "figure.walk")
            Vehicle(vehicleName: "tram")
            Vehicle(vehicleName: "bus")
            Vehicle(vehicleName: "car")
        }
    }
}

struct RemoteMeans_Previews: PreviewProvider {
    static var previews: some View {
        RemoteMeans()
    }
}

struct Vehicle: View {
    var vehicleName: String
    
    var body: some View {
        Image(systemName: vehicleName)
            .font(.largeTitle)
            .padding()
    }
}
