//
//  AlertAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation

class AlertAnnotation : Annotation {
    
    var mapAlert : MapAlert
    
    init(mapAlert: MapAlert, latitude : Double, longitude: Double) {
        self.mapAlert = mapAlert
        super.init(annotationType : AnnotationType.Alert, latitude: latitude , longitude: longitude  )
    }
    
}
