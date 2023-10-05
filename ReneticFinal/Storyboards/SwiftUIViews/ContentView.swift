//
//  ContentView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var name : String = ""
    @State var show = false
    @State var image : Data = .init(count: 0)
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    if self.image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!).resizable()
                        .frame(width: 55, height: 55)
                    .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    } else {
                        Button(action: {
                            self.show.toggle()
                        }) {
                        Image(systemName: "person.fill.badge.plus")
                            .resizable()
                            .frame(width: 100, height: 100)
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        }
                    }
                    
                    TextField("Renetic Username..", text: self.$name).padding(15)
                        .background(Color(red: 200.0/255, green: 134.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                    
                    NavigationLink(destination: Messagepage(name: self.name,image: self.$image)){
                        HStack {
                            Text("Enter Chat").padding(12)
                                .foregroundColor(.white)
                                .background((self.name.count > 0) ? Color.purple : Color.gray)
                            .cornerRadius(8)
                            
                        }
                    }
                }.background(Color.white)
                .cornerRadius(20)
                  
                .padding()
            }
        }
            .sheet(isPresented: self.$show, content: {
                ImagePicker(show: self.$show, image: self.$image)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
