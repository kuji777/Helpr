//availabilityDetail
//last modified :

import SwiftUI

struct Availability: View {
    var body: some View {
        VStack {
            Text("Disponibilité")
                .font(.largeTitle)
                TimeSlots(amOrpm: "AM", timeIcon: "clock", availablityHour1: "08h00 au 10h00", avalabilityHour2: "11h00 au 11h30")
                TimeSlots(amOrpm: "PM", timeIcon: "clock", availablityHour1: "19h00 au 20h00", avalabilityHour2: "23h00 au 23h59")
        }
    }
}

struct Availability_Previews: PreviewProvider {
    static var previews: some View {
        Availability()
    }
}

struct TimeSlots: View {
    var amOrpm: String
    var timeIcon: String
    var availablityHour1, avalabilityHour2: String
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Text(amOrpm).font(.largeTitle).bold()
                Image(systemName: timeIcon)
                    .font(.system(size: 85))
            }
            VStack {
                Text(availablityHour1).font(.title2)
                Text(avalabilityHour2).font(.title2)
            }
            Spacer()
            
        }.padding()
    }
}
