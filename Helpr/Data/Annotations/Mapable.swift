//
//  Mapable.swift
//  Helpr
//
//  Created by Vincent Qian on 22/09/2021.
//

import Foundation
import SwiftUI

protocol Mapable {
    associatedtype Content
    func getView() -> Content
}
