//
//  DetailInfoView.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import SwiftUI

struct DetailInfoView: View {
    @ObservedObject private var detailInfoViewModel = DetailInfoViewModel()
    @Environment(\.presentationMode) var presentationMode
    var item: Item

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(item.$name!.title)
                    .foregroundColor(detailInfoViewModel.isNameCorrect ? .blue : .red)) {
                    TextField("Type \(item.$name!.title)", text: $detailInfoViewModel.name)
                        .foregroundColor(detailInfoViewModel.isNameCorrect ? .black : .red)
                }
                Section(header: Text(item.$lastName!.title).foregroundColor(detailInfoViewModel.isLastNameCorrect ? .blue : .red)) {
                    TextField("Type \(item.$lastName!.title)", text: $detailInfoViewModel.lastName)
                        .foregroundColor(detailInfoViewModel.isLastNameCorrect ? .black : .red)
                }
                Section(header: Text(item.$birthdate!.title).foregroundColor(detailInfoViewModel.isBirthdateCorrect ? .blue : .red)) {
                    TextField("Type \(item.$birthdate!.title)", text: $detailInfoViewModel.birthdate)
                        .foregroundColor(detailInfoViewModel.isBirthdateCorrect ? .black : .red)
                }
                Section(header: Text(item.$childrenCount!.title).foregroundColor(detailInfoViewModel.isChildrenCountCorrect ? .blue : .red)) {
                    TextField("Type \(item.$childrenCount!.title)", text: $detailInfoViewModel.childrenCount)
                        .foregroundColor(detailInfoViewModel.isChildrenCountCorrect ? .black : .red)
                }
            }
            .padding(.top, 0)
            .onAppear {
                self.detailInfoViewModel.setup(item: self.item)
            }
        }
        .keyboardManagment()
        .navigationBarTitle(Text("Detail"), displayMode: .inline)
        .navigationBarItems(trailing:
            Button("Save") {
                self.detailInfoViewModel.save()
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(!detailInfoViewModel.canBeSaved)
        )
    }
}

struct DetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInfoView(item: Item())
    }
}
