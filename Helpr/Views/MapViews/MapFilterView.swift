//
//  MapFilterView.swift
//  Helpr
//
//  Created by Vincent Qian on 20/09/2021.
//

import SwiftUI

struct MapFilterView: View {
    //    Groups
    //    Alert around
    //    Security points
    //        police station
    //        hospital
    //        fire station
        
        @State private var showGroups = true
        @State private var showAlertAround = true
        @State private var showSafePoint = true
        @State private var showSecurityPoint = true
        @State private var showPoliceStation = true
        @State private var showHospital = true
        @State private var showFireStation = true
        
        var body: some View {
            
            
            Form {
                
                // GROUPS, ALERT ET SAFE POINT
                
                
                Section {
                    Toggle(isOn: $showGroups, label: {
                        HStack {
                            Image(systemName: "figure.wave.circle")
                                .font(.title)
                                .foregroundColor(.white)
                                .background(Color.blue.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/))
                            Text("Groupe de voyage")
                        }
                    })
                    
                    Toggle(isOn: $showAlertAround, label: {
                        HStack {
                            Image(systemName: "bell.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                                .background(Color.white.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/))
                            Text("Alertes")
                        }
                    })
                    
                        Toggle(isOn: $showSafePoint, label: {
                            HStack {
                                Image(systemName: "checkmark.shield.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .background(Color.white.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/))
                                Text("Points de sécurité")
                            }
                            
                        })
                    
                }
            
                
                // SECURITY POINTS
                
                Section {
                    Toggle(isOn: $showSecurityPoint, label: {
                        Text("Urgences")
                    })
                }
                
                // SECURITY OPTION
                
                if showSecurityPoint {
                
                Section {
                    Toggle(isOn: $showPoliceStation, label: {
                        Text("🚓 Polices")
                    })
                    
                    Toggle(isOn: $showHospital, label: {
                        Text("🚑 Hôpitaux")
                    })
                    
                    
                    Toggle(isOn: $showFireStation, label: {
                        Text("🚒 Pompiers")
                    })
                }
                
                }
            }
        }
    }

struct MapFilterView_Previews: PreviewProvider {
    static var previews: some View {
        MapFilterView()
    }
}
