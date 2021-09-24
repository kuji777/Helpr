//
//  PoliceStationAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation

class PoliceStationAnnotation : Annotation {
    
    init(data: String, latitude : Double, longitude: Double) {
        super.init(annotationType : AnnotationType.PoliceStation, latitude: latitude , longitude: longitude  )
    }
    
}
