//
//  Annotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation
import SwiftUI

class Annotation : Identifiable{
    
    let id = UUID()
    
    let annotationType : AnnotationType
    let latitude : Double
    let longitude : Double
    
    init(annotationType: AnnotationType, latitude: Double , longitude: Double) {
        self.annotationType = annotationType
        self.longitude = longitude
        self.latitude = latitude
    }
    
}

