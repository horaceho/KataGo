//
//  QipanView.swift
//  KataGo iOS
//
//  Created by Horace Ho on 19/7/2023.
//

import SwiftUI

struct QipanView: View {
    @EnvironmentObject var data: QipanData
    let minLength = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    var body: some View {
        VStack {
            Image(data.board)
                .resizable()
                .frame(width: minLength / 2.0, height: minLength / 2.0, alignment: .center)
                .rotationEffect(.degrees(data.angle))
                .shadow(color: .black.opacity(0.5), radius: 1.75, x: -1.5, y: 1.25)
        }
    }
}

struct QipanView_Previews: PreviewProvider {
    static var previews: some View {
        QipanView()
            .environmentObject(QipanData())
    }
}
