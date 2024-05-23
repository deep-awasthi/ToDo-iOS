//
//  ItemModel.swift
//  ToDo
//
//  Created by Deep Awasthi on 23/5/24.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(Id: String = UUID().uuidString, Title: String, IsCompleted: Bool){
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    //Updation
    func updateCompleted()->ItemModel{
        return ItemModel(Id: id, Title: title, IsCompleted: !isCompleted)
    }
}
