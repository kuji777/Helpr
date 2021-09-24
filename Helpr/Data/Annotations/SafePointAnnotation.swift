//
//  SafePointAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation
import SwiftUI

class SafePointAnnotation : Annotation {
    
    var safePoint : SafePoint
    
    init(safePoint: SafePoint, latitude : Double, longitude: Double) {
        self.safePoint = safePoint
        super.init(annotationType : AnnotationType.SafePoint, latitude: latitude , longitude: longitude)
    }
    
}
