//
//  Indicator.swift
//  Tessauro
//
//  Created by Aluno Mack on 03/06/25.
//

import SwiftUI

struct Indicator: View {
    var body: some View {
        HStack (spacing: 1){
            Text("Velocidade")
                .font(.system(size: 16))
                .fontWeight(.bold)
            Image(systemName: "suit.diamond.fill")
            Image(systemName: "suit.diamond.fill")
            Image(systemName: "suit.diamond.fill")
            Image(systemName: "suit.diamond")
            Image(systemName: "suit.diamond")
        }
        .font(.system(size: 13))
        .foregroundStyle(.yellowLetter)
    }
}

struct Indicator2: View {
    var body: some View {
        HStack (spacing: 1){
            Text("Força")
                .font(.system(size: 16))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Image(systemName: "suit.diamond.fill")
            Image(systemName: "suit.diamond.fill")
            Image(systemName: "suit.diamond")
            Image(systemName: "suit.diamond")
            Image(systemName: "suit.diamond")
        }
        .font(.system(size: 13))
        .foregroundStyle(.yellowLetter)
    }
}

