//
//  DataManager.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation

class DataManager {
    func loadData(fileName: String) -> [Item] {
        guard let inputURL = Bundle.main.url(forResource: fileName, withExtension: "plist") else { return [] }
        var items: [Item] = []

        if let data = try? Data(contentsOf: inputURL) {
          let decoder = PropertyListDecoder()
            if let input = try? decoder.decode(Input.self, from: data) {
                items = input.data
            }
        }

        return items
    }
}
