//
//  ItemRow.swift
//  Acumatica
//
//  Created by Genry on 06.08.2020.
//  Copyright © 2020 Genry. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    var delegate: DeleteItemProtocol

    var body: some View {
        VStack {
            NavigationLink(destination: DetailInfoView(item: item)) {
                VStack {
                    if !item.name.isEmpty {
                        HStack(alignment: .center, spacing: 10) {
                            Text(item.$name!.title)
                                .multilineTextAlignment(.trailing)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .trailing)
                            Text(":")
                            Text(item.name)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .leading)
                                .font(Font.headline.weight(.bold))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    if !item.lastName.isEmpty {
                        HStack {
                            Text(item.$lastName!.title)
                                .multilineTextAlignment(.trailing)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .trailing)
                            Text(":")
                            Text(item.lastName)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .leading)
                                .font(Font.headline.weight(.bold))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    if !item.birthdate.isEmpty {
                        HStack {
                            Text(item.$birthdate!.title)
                                .multilineTextAlignment(.trailing)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .trailing)
                            Text(":")
                            Text(item.birthdate)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .leading)
                                .font(Font.headline.weight(.bold))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    if !item.childrenCount.isEmpty {
                        HStack(alignment: .center, spacing: 10) {
                            Text(item.$childrenCount!.title)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .trailing)
                            Text(":")
                            Text(item.childrenCount)
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .leading)
                            .font(Font.headline.weight(.bold))
                        }
                        .frame(maxWidth: .infinity)

                    }
                }
            }
            Button(action: {
                self.delegate.deleteItem(id: self.item.id)
            }) {
                Text("Delete")
            }.buttonStyle(BorderlessButtonStyle())
        }
    }
}
