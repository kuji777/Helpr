//
//  FastAlertView.swift
//  Helpr
//
//  Created by François-Xavier Méité on 19/09/2021.
//

import SwiftUI

struct FastAlertView: View {
    
    @State private var scale: CGFloat = 1
    @State private var close: Bool = false
    @State private var DragOffset = CGSize.zero
    @State private var isDragged: Bool = false
    @State private var alertIsSend = false
    @State private var isClosed = false
    var body: some View {
        
        NavigationView {
            ZStack {
                
                    LinearGradient(gradient: Gradient(colors: [.red, Color("RougePourpre"), .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                VStack{
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: ContentView(),
                            isActive: $isClosed,
                            label: {
                                Image(systemName: "xmark")
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                    .padding(30)}
                        )}
                            //}
//                        Button(action:{close.toggle()}, label: {
//                            Image(systemName: "xmark")
//                                .font(.title)
//                                .foregroundColor(.black)
//                                .opacity(0.7)
//                                .padding(30)})}
                    Spacer()
                    Chevron(size: 170, opacity: 0.6)
                    Chevron(size: 160, opacity: 0.5)
                    Chevron(size: 130, opacity: 0.3)
                    Chevron(size: 120, opacity: 0.2)
                        .padding()
                    Chevron(size: 110, opacity: 0.1)
                        Button(action: { }, label: {
                                Image(systemName: "bell.circle")
                                    .foregroundColor(.black)
                                    .font(.system(size: 120))
                                    .padding()
                                    .offset(y: self.DragOffset.height)
                                    .gesture(DragGesture(minimumDistance: 200.0, coordinateSpace: .local)
                                                .onChanged { value in DragOffset = value.translation }
                                                .onEnded { value in
                                                    DragOffset = CGSize.zero; isDragged.toggle(); alertIsSend = true; NavigationLink(
                                                        destination: ContentView(),
                                                        label: {
                                                            /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                                                        })}
                                             
                                    )
                                    .gesture(DragGesture(minimumDistance: -20.0, coordinateSpace: .local)
                                                .onChanged { value in DragOffset = value.translation }
                                                .onEnded { value in }
                                             
                                    )
                                    .scaleEffect(scale)
                                    .onAppear {
                                        DispatchQueue.main.async {
                                        let baseAnimation = Animation.easeInOut(duration: 0.7)
                                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                                            withAnimation(repeated) {scale = 0.8}}}})
                            .alert(isPresented: $alertIsSend) {
                                Alert(title: Text("Important"),
                                message: Text("Votre alerte a bien été envoyée !"),
                                dismissButton: .default(Text("OK")){ isClosed.toggle()})
                            }
                    Text("Swipe Up pour alerter")
                        .font(.title2)
                        .italic()
                }
                
            }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .statusBar(hidden: true)
            
        }
        
    }
}

struct FastAlertView_Previews: PreviewProvider {
    static var previews: some View {
        FastAlertView()
    }
}

struct Chevron: View {
    var size: CGFloat
    var opacity: Double
    var body: some View {
        Image(systemName: "chevron.up")
            .font(.system(size: size))
            .opacity(opacity)
    }
}
