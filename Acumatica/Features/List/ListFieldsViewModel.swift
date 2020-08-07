//
//  ListFieldsViewModel.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation
import Combine

protocol DeleteItemProtocol {
    func deleteItem(id: UUID)
}

class ListFieldsViewModel: ObservableObject {
    @Published var items: [Item] = []

    init() {
        loadData()
    }

    func loadData() {
        items = DataManager().loadData(fileName: "input")
    }
}

extension ListFieldsViewModel: DeleteItemProtocol {
    func deleteItem(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
