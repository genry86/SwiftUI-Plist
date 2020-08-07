//
//  Input.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation

struct Input: Decodable {
    var scheme: [Metadata]
    var data: [Item]

    enum CodingKeys: String, CodingKey {
        case scheme, data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        scheme = try container.decode([Metadata].self, forKey: .scheme)
        data = try container.decode([Item].self, forKey: .data)

        for (index, _) in data.enumerated() {
            data[index].$name = scheme.first(where: { $0.id == "name" })
            data[index].$lastName = scheme.first(where: { $0.id == "lastName" })
            data[index].$birthdate = scheme.first(where: { $0.id == "birthdate" })
            data[index].$childrenCount = scheme.first(where: { $0.id == "childrenCount" })
        }
    }
}
