//
//  GroupAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation
import SwiftUI

class UserGroupAnnotation : Annotation {
    
    var userGroup : UserGroup
    
    init(userGroup: UserGroup, latitude : Double, longitude: Double) {
        self.userGroup = userGroup
        super.init(annotationType : AnnotationType.UserGroup, latitude: latitude , longitude: longitude  )
    }
    
}

