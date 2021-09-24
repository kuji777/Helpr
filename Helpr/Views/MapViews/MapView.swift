//
//  MapView.swift
//  Helpr
//
//  Created by Vincent Qian on 15/09/2021.
//
import Foundation
import SwiftUI

import MapKit
import CoreLocation


struct MapView: View {
    
    //MARK: - PROPERTIES
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var isDetailsPresented = false
    @State private var selectedModel: Annotation? = nil
    
    @State private var locations = [MKPointAnnotation]()
    
    /// Données de test safepoints
    @State private var annotations : [Annotation] = [
        SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]),latitude: 48.86240615675586, longitude:  2.4368676013707473 ),
        UserGroupAnnotation(userGroup: UserGroup(group: [  User(name: "Bruce Banner", username: "Hulk", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "bruceB",userAge: 23 ,userGender: "male"),User(name: "Peter Parker", username: "Spider Man", password: "123Leo", mail: "yesskar@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "peterP",userAge: 23 ,userGender: "male"),User(name: "Scott Lang", username: "Ant Man", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "scottL",userAge: 23 ,userGender: "male"),User(name: "Steve Roger", username: "Captain America", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "steveR",userAge: 23 ,userGender: "male"),User(name: "Thor Odinson", username: "Thor", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "thorO",userAge: 23 ,userGender: "male")], isOnlyGirl: true, destination: "Bastille"),latitude: 48.832183, longitude: 2.354602),
        UserGroupAnnotation(userGroup: UserGroup(group: [User(name: "Tony Stark", username: "Iron Man", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "tonyS",userAge: 23 ,userGender: "male"), User(name: "Natasha Romanoff", username: "Black Widow", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "natR",userAge: 23 ,userGender: "female"),User(name: "Wanda Maximoff", username: "Scarlett Witch", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "wandaM",userAge: 23 ,userGender: "female")], isOnlyGirl: true, destination: "Aubervilliers"),latitude: 48.857543, longitude: 2.334595),
        UserGroupAnnotation(userGroup: UserGroup(group: [ User(name: "Scott Lang", username: "Ant Man", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "scottL",userAge: 23 ,userGender: "male"),
                                                          User(name: "Steve Roger", username: "Captain America", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "steveR",userAge: 23 ,userGender: "male"),
                                                          User(name: "Thor Odinson", username: "Thor", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "thorO",userAge: 23 ,userGender: "male"),
                                                          User(name: "Tony Stark", username: "Iron Man", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "tonyS",userAge: 23 ,userGender: "male")], isOnlyGirl: true, destination: "Nanterre"),latitude: 48.849862, longitude: 2.290178),
        UserGroupAnnotation(userGroup: UserGroup(group: [User(name: "Natasha Romanoff", username: "Black Widow", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "natR",userAge: 23 ,userGender: "female"),
                                                         User(name: "Wanda Maximoff", username: "Scarlett Witch", password: "123Leger", mail: "fortLeger@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "wandaM",userAge: 23 ,userGender: "female"),User(name: "Bruce Banner", username: "Hulk", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "bruceB",userAge: 23 ,userGender: "male"),
                                                         User(name: "Peter Parker", username: "Spider Man", password: "123Leo", mail: "yesskar@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "peterP",userAge: 23 ,userGender: "male"),
                                                         User(name: "Scott Lang", username: "Ant Man", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "scottL",userAge: 23 ,userGender: "male")], isOnlyGirl: true, destination: "Aubervilliers"),latitude: 48.876852, longitude: 2.305970),
        UserGroupAnnotation(userGroup:  UserGroup(group: [  User(name: "Bruce Banner", username: "Hulk", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "bruceB",userAge: 23 ,userGender: "male"),
                                                            User(name: "Peter Parker", username: "Spider Man", password: "123Leo", mail: "yesskar@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "peterP",userAge: 23 ,userGender: "male"),
                                                            User(name: "Scott Lang", username: "Ant Man", password: "123Hazmel", mail: "teamInstinct@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "scottL",userAge: 23 ,userGender: "male"),
                                                            User(name: "Steve Roger", username: "Captain America", password: "123Fx", mail: "newFx@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "steveR",userAge: 23 ,userGender: "male"),
                                                            User(name: "Thor Odinson", username: "Thor", password: "123Vincent", mail: "vinvin@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: false,userIcon: "thorO",userAge: 23 ,userGender: "male"),], isOnlyGirl: true, destination: "Argentine"),latitude: 48.863529, longitude: 2.282281),
//        SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]),latitude: 48.890173, longitude: 2.304426),
//        SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]),latitude: 48.863641, longitude: 2.302022),
//        SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]),latitude: 48.889044, longitude: 2.371545),
//        SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]),latitude: 48.839977, longitude: 2.313952),
//        SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du bon coin", adress: "12 AVENUE DE LA BONHOMMIE , 75000", phoneNumber: "(+33) 6 45 45 54 54", contact: "", isOpen: true, images: ["bar_facade"]),latitude: 48.852404, longitude: 2.328330)SafePointAnnotation(safePoint: SafePoint(name: "Le Restaurant du Bonheur", adress: " 9 rue de Paris , 75012", phoneNumber: "(+33) 6 45 13 43 23", contact: "", isOpen: true, images: ["restaubonheur"]),latitude: 48.890173, longitude: 2.304426),
        SafePointAnnotation(safePoint: SafePoint(name: "CLUB DES AMIS", adress: "44 rue chevalier de la barre , 75015", phoneNumber: "(+33) 01 45 45 12 12", contact: "", isOpen: true, images: ["clubamis"]),latitude: 48.863641, longitude: 2.302022),
        SafePointAnnotation(safePoint: SafePoint(name: " Cantine SIMPON ", adress: "12 AVENUE DE SIMPLON , 75010", phoneNumber: "(+33) 7 28 23 14 54", contact: "", isOpen: false, images: ["cantinesimplon"]),latitude: 48.889044, longitude: 2.371545),
        SafePointAnnotation(safePoint: SafePoint(name: "Le RESTAURANT HELPR", adress: "12 AVENUE DES VINCENT 92000", phoneNumber: "(+33) 6 12 12 12 12", contact: "", isOpen: true, images: ["amiselphr"]),latitude: 48.839977, longitude: 2.313952),
        SafePointAnnotation(safePoint: SafePoint(name: "Le CROUS DE CRETEIL", adress: "12 AVENUE FRANÇOIS-XAVIER , 75009", phoneNumber: "(+33) 6 19 18 12 11", contact: "", isOpen: true, images: ["restau"]),latitude: 48.852404, longitude: 2.328330),
        AlertAnnotation(mapAlert: MapAlert(user: User(name: "Bruce Banner", username: "Hulk", password: "123Jean", mail: "jean1@mail.fr", adress: "", phoneNumber: "", friends: [], isOnAlert: false, isVerified: true,userIcon: "bruceB",userAge: 23 ,userGender: "male"), alertTime: "23:47", isAlertDone: false, coordinates: Coordinates(latitude: 48.878475, longitude: 2.369956)), latitude: 48.878475, longitude: 2.369956)
    ]
    
    let limitGeo = [2.210351,2.480757,48.800899,48.917902]
    
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
    
    func randomCoordinates() -> Coordinates {
        return Coordinates(latitude: Double.random(in: 48.800899...48.917902) , longitude: Double.random(in: 2.210351...2.480757))
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            //var userGroups = randomUserGroup(users: users, nbGroup: 5)
            /// création de la vue carte
            Map(coordinateRegion: $region, annotationItems: annotations){
                
                /// chargement des annotations
                annotation in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude)) {
                    Button {
                        if annotation.annotationType != AnnotationType.Alert {
                            selectedModel = annotation
                        }
                    } label: {
//                        annotation.getView()
                        switch annotation.annotationType {
                        case AnnotationType.Alert :
                            Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        case AnnotationType.SafePoint :
                            Image(systemName: "s.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        case AnnotationType.SecurityPoint :
                            Image(systemName: "s.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        case AnnotationType.Hospital :
                            Image(systemName: "s.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        case AnnotationType.PoliceStation :
                            Image(systemName: "s.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        case AnnotationType.FireStation :
                            Image(systemName: "s.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        case AnnotationType.UserGroup:
                            Image(systemName: "u.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                        }
                    }
                }
            }.onAppear {setRegion(coordinate)}
            .sheet(item: $selectedModel) { model in
               SelectedSheetView(selectedModel: model)
            }
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
}

struct SelectedSheetView : View{
    var selectedModel : Annotation
    
    var body: some View {
        ZStack{
            switch selectedModel.annotationType {
            case AnnotationType.Alert :
                Image(systemName: "a.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.red)
                .shadow(color: .black, radius: 4, x: 0.0, y: -3)
                
            case AnnotationType.SafePoint :
                SafePointDetailsView(safePoint: (selectedModel as! SafePointAnnotation).safePoint)
            case AnnotationType.SecurityPoint :
                Image(systemName: "s.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 4, x: 0.0, y: -3)
            case AnnotationType.Hospital :
                Image(systemName: "s.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 4, x: 0.0, y: -3)
            case AnnotationType.PoliceStation :
                Image(systemName: "s.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 4, x: 0.0, y: -3)
            case AnnotationType.FireStation :
                Image(systemName: "s.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 4, x: 0.0, y: -3)
            case AnnotationType.UserGroup:
                TravelGroupDetailsView(groupUsers: (selectedModel as! UserGroupAnnotation).userGroup)
            }
        }
    }
    
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 48.89, longitude: 2.33))
    }
}

