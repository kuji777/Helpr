//
//  LoginView.swift
//  LoginSignUp
//
//  Created by Leo Clemente on 22/09/2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)


struct LoginView: View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State var isConnected : Bool = false
    
    var body: some View {
        
        NavigationView{
        VStack {
            ImageLogo()
            TextField(("Username"), text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField(("Password"), text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Text("Or Sign in with")
                .italic()
                
            HStack {
                Image("fbLogo")
                    
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                Image("gmail")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
               
                Image("linkedin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
            }
            
            Button(action: {
                if (username == "Pass" && password == "Pass" ){
                    isConnected.toggle()
                }
            }, label: {
                loginButton()
            })
            
            HStack {
                Text("You don't have an account?")
                    .italic()
                    .foregroundColor(.gray)
    
              NavigationLink(
                destination: SignUpView(),
                label: {
                    Text("Sign up Now")
                })
//                            Button(action: {}, label: {
//                            Text("Sign up now")
//                                .foregroundColor(.black)
//                                .bold()
//                                .underline()
//                })
           
            }
            NavigationLink(
                destination: FastAlertView(),
                isActive : $isConnected,
                label: {
                })
        

        }.padding()
            .navigationBarHidden(true)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 11")
            
    }
}

struct ImageLogo: View {
    var body: some View {
        Image("logo_HelprBlack")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
           
    }
}

struct loginButton: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color .black)
            .cornerRadius(30.0)
            .padding(10)
    }
}
