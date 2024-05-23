//
//  ListView.swift
//  ToDo
//
//  Created by Deep Awasthi on 23/5/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            else{
                List{
                    ForEach(listViewModel.items, id: \.id){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 1.5)){
                                    listViewModel.updateItems(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                }
            }
        }
        .navigationTitle("Todo List 🖌")
                .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))

    }
}

#Preview {
    NavigationView{
                ListView()
            }.environmentObject(ListViewModel())
}
