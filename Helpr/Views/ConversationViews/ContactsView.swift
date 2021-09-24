//last modif 15h39, mercredi

//A FAIRE !!!!!!!!!!!!
//faire fonctionner les pickers : Tous/Favoris/Bloqués
//Favoris : Team Captain America
//Bloqués : Team Iron Man



//structure list de contacts
struct Contact: Identifiable {
    var id = UUID()
    var userIcon: String
    var userName: String
    var lastMessage: String
}

enum FilterOptions : String, CaseIterable {
    case All = "Tous"
    case Favorites = "Favoris"
    case Blocked = "Bloqués"
}

import SwiftUI

struct ContactsView: View {
    //picker elements variable
    @State var selection: FilterOptions = .All
    let filterOptions: [String] = ["Tous", "Favoris", "Bloqués"] // type de contact
    
    //navigation ContactsView <--> ChatView
    @State var isChatOpen: Bool = false

    //elements pour créer une liste de contact
    @State private var contacts: [Contact] = [
        Contact(userIcon: "user1", userName: "Ben Banner", lastMessage: "Last message"),
        Contact(userIcon: "user2", userName: "Alice Romanoff", lastMessage: "Last message"),
        Contact(userIcon: "user3", userName: "Sophia Parker", lastMessage: "Last message"),
        Contact(userIcon: "user4", userName: "Maxine Maximoff", lastMessage: "Last message"),
        Contact(userIcon: "user5", userName: "Margot Roger", lastMessage: "Last message"),
        Contact(userIcon: "user6", userName: "Brejda Oden", lastMessage: "Last message"),
        Contact(userIcon: "user7", userName: "Tony Benson", lastMessage: "Last message")
    ]
    
    @State private var favorites: [Contact] = [
        Contact(userIcon: "user3", userName: "Sophia Parker", lastMessage: "Last message"),
        Contact(userIcon: "user6", userName: "Brejda Oden", lastMessage: "Last message"),
        Contact(userIcon: "user7", userName: "Tony Benson", lastMessage: "Last message")]
    
    @State private var blocked: [Contact] = [
        Contact(userIcon: "user5", userName: "Margot Roger", lastMessage: "Last message")]
    
    
    var body: some View {
//        NavigationView {
            VStack {
                HStack {
                    Text("Contacts")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Spacer()
                }
                //picker bar Tous/Favoris/Bloqués
                Picker(selection: $selection,
                           label: Text("Picker"),
                           content: {
                            ForEach(FilterOptions.allCases, id: \.self) {
                                Text($0.rawValue)
                                    .font(.system(size: 40)).bold()
                                    .tag($0.rawValue)
                            }
                       }).pickerStyle(SegmentedPickerStyle())
                
                //each row of contact
                List{
                    switch selection {
                    case FilterOptions.All :
                        
                        ForEach(contacts) { item in
                            NavigationLink(destination: ChatView(contact: item),
                                           label: {ConversationRow(contact: item)}
                            )
                        }
                    case FilterOptions.Favorites :
                        ForEach(favorites) { item in
                            NavigationLink(destination: ChatView(contact: item),
                                           label: {ConversationRow(contact: item)}
                            )
                        }
                    case FilterOptions.Blocked :
                        ForEach(blocked) { item in
                            NavigationLink(destination: ChatView(contact: item),
                                           label: {ConversationRow(contact: item)}
                            )
                        }
                    }
                   
                }
                        
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//        }
    }
    }


//preview
struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

//struct ChosenPickerView {
//    var selectedView : String
//
//    var body: some View {
//        List{
//            switch selectedView in
//            case
//            ForEach(contacts) { item in
//                NavigationLink(destination: ChatView(contact: item),
//                               label: {ConversationRow(contact: item)}
//                )
//            }
//        }
//    }
//}

//subview conversation
struct ConversationRow: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Image(contact.userIcon)
                .resizable().scaledToFit()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(40)
            
            VStack(alignment: .leading) {
                Text(contact.userName).font(.title2).bold()
                Text(contact.lastMessage)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}
