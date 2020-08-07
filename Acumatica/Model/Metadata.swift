//
//  Metadata.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation

struct Metadata: Codable {
    var id: String
    var type: String
    var title: String
    var required = false
}
