//last modif 15h39, mercredi

import SwiftUI


struct ChatView: View {
    
    var contact: Contact
    @State var isAcceptedDisplay: Bool = true
    
    var body: some View {
            VStack {
                //userIcon + contactName
                NavigationLink(destination: ProfileView()) {
                    VStack {
                        Image(contact.userIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(40)
                    }.navigationTitle(contact.userName)
                }
                    
                
                
                //messages content
                //liste de conversations entre 2 users
                Divider().shadow(color: .black, radius: 23, x: 0.0, y: 0.0)
                
                ScrollView {
                    //mettre dans un messageBubble
                    //à gauche pour le receiver et à droite pour le sender
                    //la forme de bubble doit être en fonction de largeur de text
                    VStack{
                        MessageView(message: "Bonjour", isSender: false)
                        MessageView(message: "Salut", isSender: true)
                        Group{
                            MessageView(message: "Ça va?", isSender: false)
                            MessageView(message: "Oui, et toi?", isSender: true)
                            MessageView(message: "Est-ce que je peux te demander de l'aide ?", isSender: false)
                            MessageView(message: "En quoi je peux t'aider ?", isSender: true)
                            MessageView(message: "Je me sens pas bien. Il y a quel qu'un qui me suit dernière.", isSender: false)
                            MessageView(message: "Où est-ce tu es maintenant ?", isSender: true)
                            MessageView(message: "......", isSender: false)
                            MessageView(message: "....................?", isSender: true)
                            MessageView(message: "😭😭😭😭😭😭😭😭", isSender: false)
                            MessageView(message: "Où est-ce tu es maintenant ?", isSender: true)
                        }
                    }
                    
//                    messageBubble(senderMessage: "Bonjour", receiverMessage: "Salut")
//                    messageBubble(senderMessage: "Ça va?", receiverMessage: "Oui, et toi?")
//                    messageBubble(senderMessage: "Est-ce que je peux te demander de l'aide ?", receiverMessage: "En quoi je peux t'aider ?")
//                    messageBubble(senderMessage: "Je me sens pas bien. Il y a quel qu'un qui me suit dernière.", receiverMessage: "Où est-ce tu es maintenant ?")
//                    messageBubble(senderMessage: "......", receiverMessage: ".....................?")
//                    messageBubble(senderMessage: "😭😭😭😭😭😭😭😭", receiverMessage: "Où est-ce tu es maintenant ?")
                }.padding(.horizontal)
                
                Divider().shadow(color: .black, radius: 23, x: 0.0, y: 0.0)
                //Button refuser ou accepter de l'aide
                if isAcceptedDisplay {
                HStack {
                    Button(action: {isAcceptedDisplay.toggle()}) {
                        Text("Refuser")
                            .font(.system(size: 25)).bold()
                            .padding().frame(width: 145, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.red) //color to customize
                            .cornerRadius(15)
                            .padding()
                        
                    }
                    Button(action: {isAcceptedDisplay.toggle()}) {
                        Text("Accepter")
                            .font(.system(size: 25)).bold()
                            .padding().frame(width: 145, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.green) //color to customize
                            .cornerRadius(15)
                            .padding()
                
                        }
                }
            }
                
                //Message textfield
                ZStack(alignment: .trailing) {
                    TextField("Ecrire vos message ici", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding().frame(width: 370, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 1))
                    
                    //button paperplane
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                            .font(.system(size: 35))
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }

        }

    }



//preview
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChatView(contact: Contact(userIcon: "bruceB", userName: "Hulk", lastMessage: "last message"))
        }
    }
}

//subview messageView
struct MessageView: View {
    let message: String
    let isSender: Bool
    
    var body: some View {
        HStack {
               if isSender {
                    Spacer()
               }

            VStack(alignment: isSender ? .trailing : .leading, spacing: 0) {
               Text(message)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(isSender ? Color.blue : Color("LightGray"))
                    .foregroundColor(isSender ? Color.white : Color.black)
                    .cornerRadius(16)
            
               
                    MessageTailView(isSender: isSender) { isSender ? Color.blue : Color("LightGray") }
                                .frame(width: 20, height: 16, alignment: .leading)
                                .offset(x: 0, y: -8)
                        
                    }
               if !isSender {
                    Spacer()
               }
        }
     }
}

struct MessageTailView<Background: ShapeStyle>: View {
    let isSender: Bool
    let backgroundFill: Background
    
    init(isSender: Bool, background: () -> Background) {
        self.isSender = isSender
        self.backgroundFill = background()
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let origin: CGPoint
                let curveOnePoint: CGPoint
                let curveOneControl: CGPoint
                let curveTwoPoint: CGPoint
                let curveTwoControl: CGPoint
                
                if isSender {
                    origin = CGPoint(x: geometry.size.width * 0.65, y: 0)
                    curveOnePoint = CGPoint(x: geometry.size.width, y: geometry.size.height)
                    curveOneControl = CGPoint(x: geometry.size.width * 0.75, y: geometry.size.height * 0.75)
                    curveTwoPoint = CGPoint(x: geometry.size.width * 0.25, y: 0)
                    curveTwoControl = CGPoint(x: geometry.size.width * 0.15, y: geometry.size.height * 0.25)
                } else {
                    origin = CGPoint(x: geometry.size.width * 0.35, y: 0)
                    curveOnePoint = CGPoint(x: 0, y: geometry.size.height)
                    curveOneControl = CGPoint(x: geometry.size.width * 0.25, y: geometry.size.height * 0.75)
                    curveTwoPoint = CGPoint(x: geometry.size.width * 0.75, y: 0)
                    curveTwoControl = CGPoint(x: geometry.size.width * 0.85, y: geometry.size.height * 0.25)
                }
                
                path.move(to: origin)
                path.addQuadCurve(to: curveOnePoint, control: curveOneControl)
                path.addQuadCurve(to: curveTwoPoint, control: curveTwoControl)
            }
            .fill(self.backgroundFill)
        }
    }
}

//subView messagebubble
struct messageBubble: View {
    let senderMessage: String
    let receiverMessage: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
//            Text(senderMessage).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                .frame(width: 320, height: 50, alignment: .leading)
//                .background(Color.gray.opacity(0.3))
//                .cornerRadius(20)
            HStack {
                           
                Text(senderMessage)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(16)
                Spacer()
            }
            
        
            HStack {
                Spacer()
                Text(receiverMessage)
//                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .foregroundColor(Color.white)
//                    .frame(width: 320, height: 50, alignment: .trailing)
                    .background(Color.blue)
                    .cornerRadius(16)
 
            }
                
        }
    }
}
