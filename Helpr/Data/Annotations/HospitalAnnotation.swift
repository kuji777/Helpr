//
//  HospitalAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation

class HospitalAnnotation : Annotation {
    
    init(data: String, latitude : Double, longitude: Double) {
        super.init(annotationType : AnnotationType.Hospital, latitude: latitude , longitude: longitude  )
    }
    
}
