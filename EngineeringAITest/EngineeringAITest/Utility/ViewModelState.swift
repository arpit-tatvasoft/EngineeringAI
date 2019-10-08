//
//  ViewModelState.swift
//  EngineeringAI_PracticalTest
//
//  Created by PCQ188 on 03/07/19.
//  Copyright © 2019 PCQ188. All rights reserved.
//

import Foundation

enum ViewModelState<T> {
    case loading
    case failure(WebError)
    case finish(Bool)
    case success(T)
}
