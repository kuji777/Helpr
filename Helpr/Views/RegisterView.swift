//
//  RegisterView.swift
//  LoginSignUp
//
//  Created by Leo Clemente on 22/09/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username : String = ""
    @State var firstname : String = ""
    @State var lastname : String = ""
    @State var dobDay : String = ""
    @State var dobMonth : String = ""
    @State var dobYear : String = ""
    @State var emailAdress : String = ""
    @State var phoneNumber : String = ""
    @State var adress : String = ""
    @State var city : String = ""
    
   

    @State private var selectedGenderIndex: Int = 0
        
        private var genderOptions = ["🙍‍♂️ Male", "🙍‍♀️ Female", "🤖 Other"]
   
    
    
    
    var body: some View {
        
       
        NavigationView {
               
            Form {
            
            VStack {
                

                HStack {
                    Spacer()
                    Image(systemName: "person.fill.viewfinder")
                        .font(.system(size: 90))
                    Spacer()
                }

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Take your profil Picture")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding(.bottom)
                })
            }
                
            Picker("Gender", selection: $selectedGenderIndex) {
                    ForEach(0..<genderOptions.count) {
                         Text(self.genderOptions[$0])
                    }
            }
            // FIRST  NAME
            TextField(("First Name"), text: $firstname)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            // LAST  NAME
            TextField(("Last Name"), text: $lastname)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            
            // GENDER
            
           
            
            // DATE OF  BIRTH
            
                HStack {
                    
                    Spacer()
                    Text("Date of birth")
                        .bold()
                    Spacer()
                }
            
            
            
            HStack {
                TextField(("Day"), text: $dobDay)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                TextField(("Month"), text: $dobMonth)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                TextField(("Year"), text: $dobYear)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
            }
            
            // EMAIL ADRESS
            TextField(("Email Adress"), text: $emailAdress)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            // PHONE NUMBER
            TextField(("Phone Number"), text: $phoneNumber)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            // ADRESS
            HStack {
                TextField(("Adress"), text: $adress)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField(("City"), text: $city)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
            }
        
                
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Scan your ID  Card")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color .black)
                        .cornerRadius(30.0)
                        .padding(10)
                })
                Spacer()
            }
            
            }
            .navigationTitle("Sign Up")
//            .navigationBarHidden(true)
        
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .previewDevice("iPhone 11")
    }
}
