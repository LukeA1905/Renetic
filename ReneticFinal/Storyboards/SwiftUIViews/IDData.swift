//
//  ContentView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 12/04/2023.
//


import SwiftUI


struct iDData : Identifiable {
    var id: String
    var name : String
    var msg : String
    @State var image : Data
}
