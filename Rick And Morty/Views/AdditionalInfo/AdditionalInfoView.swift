//
//  AdditionalInfoView.swift
//  Rick And Morty
//
//  Created by Andres Mendieta on 25/06/23.
//

import SwiftUI

struct AdditionalInfoView: View {
    let model: AdditionalInfoModel
    
    var body: some View {
        if model.typeOrCard == .place {
            VStack(alignment: .leading) {
                Text("Place")
                    .textCase(.uppercase)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Name: \(model.name)")
                            .font(.title2)
                        Text("Type: \(model.type)")
                            .font(.title2)
                        Text("Dimension: \(model.dimension)")
                            .font(.title2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 18)
        }
        
        if model.typeOrCard == .episode {
            VStack(alignment: .leading) {
                Text("Episodes")
                    .textCase(.uppercase)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(model.episodes, id: \.self) { episode in
                            Text(episode)
                                .font(.title2)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 18)
        }
        
    }
}

struct AdditionalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 10) {
            AdditionalInfoView(model: .testModel)
            AdditionalInfoView(model: .testModel2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
