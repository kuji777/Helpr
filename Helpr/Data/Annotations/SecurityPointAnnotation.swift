//
//  SecurityPointAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation

class SecurityPointAnnotation : Annotation {
    
    init(data: String, latitude : Double, longitude: Double) {
        super.init(annotationType : AnnotationType.SecurityPoint, latitude: latitude , longitude: longitude  )
    }
    
}
