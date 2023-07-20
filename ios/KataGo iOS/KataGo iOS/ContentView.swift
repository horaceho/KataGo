//
//  ContentView.swift
//  KataGo iOS
//
//  Created by Chin-Chang Yang on 2023/7/2.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = QipanData()
    var body: some View {
        ZStack(alignment: .topTrailing) {
            GtpView()
            QipanView()
        }
        .environmentObject(data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
