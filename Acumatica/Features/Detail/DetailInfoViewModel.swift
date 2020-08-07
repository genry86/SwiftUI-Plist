//
//  DetailInfoViewModel.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import Foundation
import Combine

class DetailInfoViewModel: ObservableObject {
    private var cancellableSet: Set<AnyCancellable> = []

    var item: Item!
    @Published var tempItem: Item!

    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var birthdate: String = ""
    @Published var childrenCount: String = ""

    var isNameCorrect: Bool {
        guard let item = item else { return true }
        var isCorrect = isRiquiredValueCorrect(required: item.$name!.required, value: name)
        isCorrect = isCorrect && isTypeValueCorrect(type: item.$name!.type, value: name)
        return isCorrect
    }

    var isLastNameCorrect: Bool {
        guard let item = item else { return true }
        var isCorrect = isRiquiredValueCorrect(required: item.$lastName!.required, value: lastName)
        isCorrect = isCorrect && isTypeValueCorrect(type: item.$lastName!.type, value: lastName)
        return isCorrect
    }

    var isBirthdateCorrect: Bool {
        guard let item = item else { return true }
        var isCorrect = isRiquiredValueCorrect(required: item.$birthdate!.required, value: birthdate)
        isCorrect = isCorrect && isTypeValueCorrect(type: item.$birthdate!.type, value: birthdate)
        return isCorrect
    }

    var isChildrenCountCorrect: Bool {
        guard let item = item else { return true }
        var isCorrect = isRiquiredValueCorrect(required: item.$childrenCount!.required, value: childrenCount)
        isCorrect = isCorrect && isTypeValueCorrect(type: item.$childrenCount!.type, value: childrenCount)
        return isCorrect
    }

    var canBeSaved: Bool {
        isNameCorrect && isLastNameCorrect && isBirthdateCorrect && isChildrenCountCorrect
    }

    func setup(item: Item) {
        self.item = item
        self.tempItem = item

        $tempItem
            .map { $0!.name }
            .assign(to: \.name, on: self)
            .store(in: &cancellableSet)

        $tempItem
            .map { $0!.lastName }
            .assign(to: \.lastName, on: self)
            .store(in: &cancellableSet)

        $tempItem
            .map { $0!.birthdate }
            .assign(to: \.birthdate, on: self)
            .store(in: &cancellableSet)

        $tempItem
            .map { $0!.childrenCount }
            .assign(to: \.childrenCount, on: self)
            .store(in: &cancellableSet)
    }

    func save() {
        item.name = name
        item.lastName = lastName
        item.birthdate = birthdate
        item.childrenCount = childrenCount
    }
}


private extension DetailInfoViewModel {
    func isRiquiredValueCorrect(required: Bool, value: String) -> Bool {
        return required ? !value.isEmpty : true
    }

    func isTypeValueCorrect(type: String, value: String) -> Bool {
        switch type {
        case "date":
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            formatter.date(from: value)
            return formatter.date(from: value) != nil
        case "number":
            return Int(value) != nil || value.isEmpty
        default:
            return true
        }
    }
}
