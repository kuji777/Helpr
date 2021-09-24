//
//  TravelGroupDetailsView.swift
//  Helpr
//
//  Created by Vincent Qian on 19/09/2021.
//

import SwiftUI

struct TravelGroupDetailsView: View {
    
    // Liste des perssonnes dans le groupe
   /* @State private var groupUsers: [User] = [
        User(name: "Jean", username: "SuperJean", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "male",userAge: 23 ,userGender: "le"),
        User(name: "Leo", username: "DamBoy", password: "123Leo", mail: "@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "male",userAge: 23 ,userGender: "le"),
        User(name: "Hazmel", username: "leBG", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "male",userAge: 23 ,userGender: "le"),
        User(name: "Fx", username: "Motoman", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "male",userAge: 23 ,userGender: "le"),
        User(name: "Vincent", username: "Mangeeer", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "male",userAge: 23 ,userGender: "le"),
        User(name: "Léger", username: "Sécuritax", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "male",userAge: 23 ,userGender: "le")
    ]*/
    
    var groupUsers: UserGroup
    
    var body: some View {
        
        VStack {
            Image(systemName: "figure.wave.circle")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .padding(.bottom)
            Text("Il y a \(groupUsers.group.count) personnes dans le groupe : ")
                .bold()
            Text("En route pour \(groupUsers.destination)")
                .font(.title)
                .foregroundColor(.blue)
            List (groupUsers.group){ user in
                HStack {
                    Text(user.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    if user.isVerified {
                        Image(systemName: "checkmark.shield")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                
            }
            
            Button(action:{}, label: {
                                
                            Text("REJOINDRE")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60, alignment: .center)
                                .background(Color .blue)
                                .cornerRadius(30.0)
                                .padding(10)
                            })
        }
    }
}

struct TravelGroupDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TravelGroupDetailsView(groupUsers: UserGroup(group: [User(name: "Bruce Banner", username: "Hulk", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "bruceB",userAge: 23 ,userGender: "male"),User(name: "Peter Parker", username: "Spider Man", password: "123Leo", mail: "yesskar@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "peterP",userAge: 23 ,userGender: "male"),User(name: "Scott Lang", username: "Ant Man", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "scottL",userAge: 23 ,userGender: "male"),User(name: "Steve Roger", username: "Captain America", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "steveR",userAge: 23 ,userGender: "male"),User(name: "Thor Odinson", username: "Thor", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "thorO",userAge: 23 ,userGender: "male")], isOnlyGirl: true, destination: "Bastille"))
    }
}
