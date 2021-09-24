//last modif 15h39, mercredi

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //icon, username, age, genre, verified prrofil
            ProfileHeader()
            Spacer()
            
//            List {
                //1st row
                HStack {
                    Spacer()
                    NavigationLink(destination: RemoteMeans()) {
                        buttonIcon(iconName: "modeDeplacements_v2", iconText: "Deplacements", navigTitle: "Mode de deplacements")}
                    
                    Spacer()
                    NavigationLink(destination: Language()) {
                        buttonIcon(iconName: "langues_v2", iconText: "Langues", navigTitle: "Langues Parlées")}
                    Spacer()
                    NavigationLink(destination: Availability()) {
                        buttonIcon(iconName: "dayOrNight", iconText: "Disponibilité", navigTitle: "Disponibilité")}
                    
                    Spacer()
                }
                
                //2nd row
                HStack {
                    Spacer()
                    NavigationLink(destination: FrequentItinerary()) {
                        buttonIcon(iconName: "itinerary", iconText: "Itinéraires Favoris", navigTitle: "Itinéraires Favoris")}
                    
                    Spacer()
                    NavigationLink(destination: Review()) {
                        buttonIcon(iconName: "reviews", iconText: "Avis", navigTitle: "Avis d'autres utilisateurs")}
                    Spacer()
                }
            Spacer()
            buttonText(text: "Bloquer Profil")
            buttonText(text: "Ajouter dans Favoris")
            buttonText(text: "Signaler Profil")
            
            Spacer()
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


//profileheader
struct ProfileHeader: View {

    //bruce banner
    let user = User(name: "Bruce Banner", username: "Ben Banner", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "user1",userAge: 23 ,userGender: "male")
        
    var body: some View {
        VStack(spacing: 5){
            Image(user.userIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 125, alignment: .center)
                .cornerRadius(75)

            HStack {
                Text(user.username)
                    .font(.title)
                    .bold()
            }
            
            HStack {
                Text("\(String(user.userAge)) ans")
                Image("male")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
            }.font(.system(size:20))
            
            Text("\(Image(systemName: "checkmark.shield")) Profil Vérifié")
                .font(.system(size:20))
        }
    
    }
}

//button type ICON
struct buttonIcon: View {
    var iconName: String
    var iconText: String
    var navigTitle: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)

            Text(iconText)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }.padding(.all, 3)
        //.navigationTitle(navigTitle)
    }
}

//button type TEXT
struct buttonText: View {
    var text: String
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text(text)
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .frame(width: 300, height: 45 )
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
        }
    }
}
