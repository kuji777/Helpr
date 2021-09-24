//
//  ProfilView.swift
//  helpR
//
//  Created by Hazmil HASBULLAH on 20/09/2021.
//

import SwiftUI


    var users: [User] = [
        User(name: "Bruce Banner",username: "Bruce Banner",password: "123Bruce",mail:"bruce@mail.com",adress:"",phoneNumber:"",friends: [],isOnAlert: false,isVerified: true, userIcon: "bruceB" , userAge: 25, userGender: "Male"),
        User(name: "Peter Parker", username: "Peter Parker",password: "123Bruce",mail:"bruce@mail.com",adress:"",phoneNumber:"",friends: [],isOnAlert: false,isVerified: true,userIcon: "peterP", userAge: 25, userGender: "Male"),
        User(name: "Wanda Maximoff", username: "Wanda Maximoff",password: "123Bruce",mail:"bruce@mail.com",adress:"",phoneNumber:"",friends: [],isOnAlert: false,isVerified: true,userIcon: "wandaM", userAge: 25, userGender: "Female"),
        User(name: "Steve Roger", username: "Steve Roger",password: "123Bruce",mail:"bruce@mail.com",adress:"",phoneNumber:"",friends: [],isOnAlert: false,isVerified: true,userIcon: "steveR", userAge: 25, userGender: "Male"),
        User(name: "Thor Odinson", username: "Thor Odinson",password: "123Bruce",mail:"bruce@mail.com",adress:"",phoneNumber:"",friends: [],isOnAlert: false,isVerified: true,userIcon: "thorO", userAge: 25, userGender: "Male"),
        User(name: "Tony Stark", username: "Tony Stark",password: "123Bruce",mail:"bruce@mail.com",adress:"",phoneNumber:"",friends: [],isOnAlert: false,isVerified: true,userIcon: "tonyS", userAge: 25, userGender: "Male"),
        User(name: "Jeanette", username: "SuperJeanette", password: "123Jeanette", mail: "jeanette1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "verifiedProfile",userAge: 23 ,userGender: "Female"),
        User(name: "Leo", username: "DamBoy", password: "123Leo", mail: "@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "verifiedProfile",userAge: 23 ,userGender: "Male"),
        User(name: "Hazmel", username: "leBG", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "verifiedProfile",userAge: 23 ,userGender: "Male"),
        User(name: "Fx", username: "Motoman", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "verifiedProfile",userAge: 23 ,userGender: "Male"),
        User(name: "Vincent", username: "Mangeeer", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "verifiedProfile",userAge: 23 ,userGender: "Male"),
        User(name: "Léger", username: "Sécuritax", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "verifiedProfile",userAge: 23 ,userGender: "Male")
    ]


func randomUserGroup(users: [User], nbGroup: Int) -> [UserGroup] {
    
    var userGroups: [UserGroup] = []
    var group: UserGroup
    for _ in 1...nbGroup {
        group = UserGroup(group: [], isOnlyGirl: Bool.random(), destination: "Bastille")
        let randomNb = Int.random(in: 1..<7)
        var listIndex = users.count-1
        
        for _ in 1...randomNb {
            group.group.append( users[ Int.random(in: 0...listIndex) ])
            listIndex -= 1
        }
        userGroups.append(group)
    }
    
    return userGroups
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()

            //profil info
            ProfileHeader()

            List {
                //button avec profil details
                HStack {
                    iconButton(icon: "modeDeplacements_v2", buttonName: "Deplacement")
                    iconButton(icon: "langues_v2", buttonName: "Langues")
                    iconButton(icon: "itinerary", buttonName: "Itinéraires Favoris")
                }
                
                HStack {
                    iconButton(icon: "dayOrNight", buttonName: "Disponibilité")
                    iconButton(icon: "reviews", buttonName: "Avis")
//                    iconButton(icon: "quartier", buttonName: "Quartier")
                }

            
            }

            textButton(text: "Signaler profil")
            textButton(text: "Ajouter dans favoris")
            textButton(text: "Bloquer profil")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//button type icon
struct iconButton: View {
    var icon: String
    var buttonName: String
    
    var body: some View {
        Button(action: {}) {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                Text(buttonName)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
            
        }
    }
}
}

//button type texte
struct textButton: View {
    var text: String
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Text(text).font(.title3)
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
//                    .background(Color.gray)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(20)
                    .padding(5)

            }
            
        }
    }
}

//profileheader
struct ProfileHeader: View {

    //bruce banner
    let user = users[0]
        
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
