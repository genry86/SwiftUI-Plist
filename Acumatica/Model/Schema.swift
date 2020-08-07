//
//  Schema.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation

@propertyWrapper struct Schema {
    var wrappedValue: String
    var projectedValue: Metadata!

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
//        projectedValue = metadata
    }

    func isCorrect() -> Bool {
        return false
    }
}
