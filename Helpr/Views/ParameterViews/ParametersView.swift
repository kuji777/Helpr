//
//  ParametresView.swift
//  HelprParametresView
//
//  Created by François-Xavier Méité on 21/09/2021.
// VALIDER PAR EQUIPE !
//Navlink $$
import SwiftUI

struct ParametersView: View {
    
    @State var isDispo: Bool
    @State var isDay: Bool
    @State var isLocated: Bool
    @State private var selectedMode = AlertMode.swipeUp
    @State private var selectedLang = Language.Francais
//    @State private var isBackIsPresented: Bool
    enum AlertMode: String, CaseIterable, Identifiable {
        case swipeUp
        case hold
        var id: String { self.rawValue }
    }
    enum Language: String, CaseIterable, Identifiable {
        case Francais
        case Anglais
        case Italien
        case Espagnol
        case Arabe
        case Russe
        case Allemand
        var id:String { self.rawValue }
    }
    var body: some View {
        
//        NavigationView {
        VStack {
            HStack {
                Text("Paramètres")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            Form {
                    Section {
                        HStack {
                            Spacer()
                            Text("Général")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Profil")})
                    Picker("Langue", selection: $selectedLang) {
                        Text("Français").tag(Language.Francais)
                        Text("Anglais").tag(Language.Anglais)
                        Text("Italien").tag(Language.Italien)
                        Text("Espagnol").tag(Language.Espagnol)
                        Text("Arabe").tag(Language.Arabe)
                        Text("Russe").tag(Language.Russe)
                        Text("Allemand").tag(Language.Allemand)
                    }.foregroundColor(.blue)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Contacts d'urgence")})
                        // Francais - Anglais + textfield
                        Toggle(isOn: $isDispo, label: {
                            Text("Disponible")
                        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Picker("Mode d'alerte immédiate :", selection: $selectedMode) {
                                Text("Swipe Up").tag(AlertMode.swipeUp)
                                Text("Hold").tag(AlertMode.hold)
                        }.foregroundColor(.blue)
                        // toggle switch Swipe or press
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Trajets planifiés")})
                        // pour trajet de tout les jours
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Suggestions de trajets")})
                    }
                    
                    Section {
                        HStack {
                            Spacer()
                            Text("Carte")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        Toggle(isOn: $isDay, label: {
                            Text("Couleur de la carte (jour/nuit)")
                        }).foregroundColor(.blue)
    //                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
    //                            Text("Couleur de la carte (jour/nuit)")
    //                    })
                        Toggle(isOn: $isLocated, label: {
                                Text("Localisation")}).foregroundColor(.blue)
    //                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
    //                            Text("Localisation")})
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Mon icone")})
                        // choix d'une icone pour la placer sur la map
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Voir sur la carte")})
                        // ce que l'on veux voir sur la map
                        }
                        
                    Section {
                        HStack {
                            Spacer()
                            Text("Confidentialité")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Ce que je partage")})
                        /* me contacter - voir ma localisation - voir mon statu - voir ma photo - m'ajouter aux amis etc ..*/
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Conversation")})
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Historique")})
                        // historique On/off -> Trajet + Discussion + aide apporté
                    }
                        
                        Section {
                            HStack {
                                Spacer()
                                Text("Compte & Connexion")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Spacer()
                            }
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Gérer mes identifiants")})
                            // Changer adresse mail - numero de telephone - mot de passe etc..
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Devenir inactif")})
                            // Deviens inactif - Suspendre l'activité
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Supprimer le compte")})
                                .foregroundColor(.red)
                       }
                    
                    Section {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Signaler un problème")})
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Aide")})
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("A propos")})
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Inviter un ami")})
                    }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//            .navigationTitle("Paramètres")
//            .navigationBarItems(leading: Button(action: {isBackIsPresented.toggle()            }, label: {
//                Image(systemName: "chevron.left")
//                Text("Back")
//                Image(systemName: "arrow.backward")
//                    .font(.title)
//        }))
//        }
    }
}

struct ParametresView_Previews: PreviewProvider {
    static var previews: some View {
        ParametersView(isDispo: true, isDay: true, isLocated: true)
            .previewDevice("iPhone 12")
    }
}
