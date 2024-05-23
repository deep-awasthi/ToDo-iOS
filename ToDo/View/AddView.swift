//
//  AddView.swift
//  ToDo
//
//  Created by Deep Awasthi on 23/5/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel

    @State var textFieldText: String = ""
    @State var alertText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type Something here...", text: $textFieldText)
                    .foregroundStyle(Color(.black))
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Button {
                    saveButtonTapped()
                } label: {
                    Text("Save Todo")
                        .foregroundStyle(Color(.blue))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color(.pink.opacity(0.5)))
                }
            }
            .padding(16)
        }
        .navigationTitle("Add An Item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonTapped(){
        if(textValid()){
            listViewModel.addItems(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textValid()->Bool{
        if textFieldText.count<3 {
            alertText = "Title should contain atleast 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()-> Alert{
        return Alert(title: Text(alertText))
    }
}

#Preview {
    AddView()
}
