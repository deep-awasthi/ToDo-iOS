//
//  ListRowView.swift
//  ToDo
//
//  Created by Deep Awasthi on 23/5/24.
//

import SwiftUI

var sampleItemModelIncomplete: ItemModel = ItemModel(Title: "todo", IsCompleted: false)
var sampleItemModelComplete: ItemModel = ItemModel(Title: "todo", IsCompleted: true)

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "square" : "circle")
                .foregroundStyle(item.isCompleted ? Color(.green) : Color(.red))
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    Group{
        ListRowView(item: sampleItemModelIncomplete)
        ListRowView(item: sampleItemModelComplete)
    }
}
