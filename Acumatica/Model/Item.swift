//
//  Item.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation

class Item: Decodable, Identifiable {
    var id = UUID()
    @Schema var name: String = ""
    @Schema var lastName: String = ""
    @Schema var birthdate: String = ""
    @Schema var childrenCount: String = ""

    enum CodingKeys: String, CodingKey {
        case name, lastName, birthdate, childrenCount
    }

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        lastName = try container.decode(String.self, forKey: .lastName)
        birthdate = try container.decode(String.self, forKey: .birthdate)
        childrenCount = try container.decode(String.self, forKey: .childrenCount)
    }
}
