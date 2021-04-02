//
//  SnackbarViewModel.swift
//  SnackBar
//
//  Created by Mark Markov on 2.04.21.
//

import Foundation
import UIKit

typealias Handler = (() -> Void)

enum SnackbarViewType {
    case info
    case action(handler: Handler)
}

struct SnackbarViewModel {
    let type: SnackbarViewType
    let text: String
    let image: UIImage?
}
