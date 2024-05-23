//
//  NoListView.swift
//  ToDo
//
//  Created by Deep Awasthi on 23/5/24.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There Are No Items!!!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Add Some Todos")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Todo😄")
                        .foregroundStyle(Color(.blue))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color(.green).opacity(0.2) : Color(.gray).opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: .pink, radius: 30, x: 0, y: 5)
                .offset(x: 5, y: 5)

            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: {
                addAnimation()
            })
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else{
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NoListView()
}
