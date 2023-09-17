//
//  Extension.swift
//  iExpense
//
//  Created by Ray Nahimi on 16/09/2023.
//

import Foundation
import SwiftUI

extension Text {
    func modify(for amount: Double) -> Self {
            let font: Font
            let color: Color
            switch amount {
            case 0..<10:
                font = .largeTitle
                color = .red
            case 10..<100:
                font = .title
                color = .green
            default:
                font = .headline
                color = .orange
            }
            return self
                .font(font)
                .foregroundColor(color)
        }
}
