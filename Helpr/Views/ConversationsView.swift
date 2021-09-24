//
//  ContactView.swift
//  HELPR_v0
//
//  Created by Hazmil HASBULLAH on 15/09/2021.
//

import SwiftUI

//conversation
//senderName
//messageContent


struct ConversationsView: View {
    var body: some View {

        VStack(alignment: .leading) {

            //title bar + edit button
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 125) {
                Text("Conversations")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.all, 10)
                
                //button edit
                EditButton()
                    .padding()
            }
            
            //bar
            HStack(alignment: .center, spacing: 125) {
                Text("Membres")
                    .font(.system(size: 20))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 35)
                Text("Amis")
                    .font(.system(size: 20))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 30)
            }
            
            Spacer()
            
            /// Display conversation elements
            List {
                Conversation(senderName: "Léo", messageContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..")
                Conversation(senderName: "Vincent", messageContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..")
                Conversation(senderName: "Leger", messageContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..")
                Conversation(senderName: "FX", messageContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..")
                Conversation(senderName: "Hazmil", messageContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..")
                Conversation(senderName: "Jacyntha", messageContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..")
            }

            }
        }
    }



//preview
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}


//SubView
struct Conversation: View {
    let senderName: String
    let messageContent: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(senderName)
                .font(.title3)
                .bold()
            Text(messageContent)
                .font(.body)
                .foregroundColor(.gray).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }.padding()
    }
}
