//
//  User.swift
//  Helpr
//
//  Created by Vincent Qian on 19/09/2021.
//

import Foundation

struct User : Identifiable{
    
    let id = UUID()
    
    var name : String
    var username : String
    var password : String
    var mail : String
    var adress : String
    var phoneNumber : String
    var friends : [User]
    var isOnAlert : Bool
    var isVerified : Bool
    var userIcon: String
    var userAge: Int
    var userGender: String
    
}

var users: [User] = [
            User(name: "Bruce Banner", username: "Hulk", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "bruceB",userAge: 23 ,userGender: "male"),
            User(name: "Peter Parker", username: "Spider Man", password: "123Leo", mail: "yesskar@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "peterP",userAge: 23 ,userGender: "male"),
            User(name: "Scott Lang", username: "Ant Man", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "scottL",userAge: 23 ,userGender: "male"),
            User(name: "Steve Roger", username: "Captain America", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "steveR",userAge: 23 ,userGender: "male"),
            User(name: "Thor Odinson", username: "Thor", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "thorO",userAge: 23 ,userGender: "male"),
            User(name: "Tony Stark", username: "Iron Man", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "tonyS",userAge: 23 ,userGender: "male"),
            User(name: "Natasha Romanoff", username: "Black Widow", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "natR",userAge: 23 ,userGender: "female"),
            User(name: "Wanda Maximoff", username: "Scarlett Witch", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "wandaM",userAge: 23 ,userGender: "female")
]

