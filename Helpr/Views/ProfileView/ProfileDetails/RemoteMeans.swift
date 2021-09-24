//modified 22h41 mercredi

import SwiftUI

struct RemoteMeans: View {
    var body: some View {
        VStack {
            Text("Moyens de déplacement")
                .font(.largeTitle)
            HStack {
                Vehicle(vehicleName: "figure.walk")
                Vehicle(vehicleName: "bicycle")
            }
            HStack {
                Vehicle(vehicleName: "bus")
                Vehicle(vehicleName: "car").foregroundColor(Color.gray.opacity(0.35))
            }
            HStack {
                Vehicle(vehicleName: "tram").foregroundColor(Color.gray.opacity(0.35))
                Vehicle(vehicleName: "airplane").foregroundColor(Color.gray.opacity(0.35))
            }
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
                .font(.system(size: 80))
                .frame(width: 120, height: 90, alignment: .center)
                .padding()
            
    }
}
