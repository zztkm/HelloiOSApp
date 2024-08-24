//
//  BackgroundModifier.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI

extension Image {
    func backgroundModifier() -> some View {
        self
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
    }
}
