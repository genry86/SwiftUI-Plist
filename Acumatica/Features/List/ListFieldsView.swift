//
//  ListFieldsView.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import SwiftUI

struct ListFieldsView: View {
    @ObservedObject private var listFieldsViewModel = ListFieldsViewModel()

    var body: some View {
        NavigationView {
            List(listFieldsViewModel.items) { item in
                ItemRow(item: item, delegate: self.listFieldsViewModel)
            }
            .id(UUID())
            .onAppear {
                self.listFieldsViewModel.objectWillChange.send()
                UITableView.appearance().tableFooterView = UIView()
            }
            .navigationBarTitle("Data")
            .navigationBarItems(trailing:
                Button("Restore") {
                    self.listFieldsViewModel.loadData()
                }
            )
        }
    }
}

struct ListFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        ListFieldsView()
    }
}
