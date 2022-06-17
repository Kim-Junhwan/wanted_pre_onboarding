//
//  StringExtension.swift
//  wanted_pre_onboarding
//
//  Created by JunHwan Kim on 2022/06/18.
//

import Foundation

extension String {
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}
