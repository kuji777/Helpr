//
//  CreaTest.swift
//  HelprProject
//
//  Created by François-Xavier Méité on 15/09/2021.
//

import SwiftUI


struct AlertView: View {
    var body: some View {
        
        NavigationView {
//            GeometryReader { geo in
        ZStack {
            Rectangle()
            LinearGradient(gradient: Gradient(colors: [.red, Color("RougePourpre"), .purple, Color("VioletPastel")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .foregroundColor(Color("RougePourpre"))
                .ignoresSafeArea()
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 50)
                        .frame(width: 500, height: 350)
                        .foregroundColor(Color(.red))
                        .opacity(0.5)
                        .blur(radius: 25)
                    Image(systemName: "megaphone.fill")
                        .font(.system(size: 140))
                        .shadow(color: .white, radius: 10, x: 0, y: 0)
                }
                Spacer()
                Image(systemName: "chevron.up")
                    .foregroundColor(.primary)
                    .font(.system(size: 80))
                    .opacity(0.3)
                    .blur(radius: 5)
                Image(systemName: "chevron.up.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .padding()
                    .opacity(0.3)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    //.blur(radius: 3.0)
                ZStack {
                    Capsule()
                        .frame(width: 300, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .opacity(0.1)
                Text("Swipe Up pour alerter")
                    .font(.title2)
                    .bold()
                    .padding()
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }

            }
        }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlertView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12")
            AlertView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 8")
            AlertView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 7")
        }
    }
}

