//
//  SafePoint.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation


struct SafePoint : Identifiable{
    
    let id = UUID()
    
    var name : String
    var adress : String
    var phoneNumber : String
    var contact : String
    var isOpen : Bool
    var images : [String]
    
}
