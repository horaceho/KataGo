//
//  QipanData.swift
//  KataGo iOS
//
//  Created by Horace Ho on 19/7/2023.
//

import SwiftUI

class QipanData: ObservableObject {
    @Published var board: String = "Darker"
    @Published var angle: Double = 0.0
}
