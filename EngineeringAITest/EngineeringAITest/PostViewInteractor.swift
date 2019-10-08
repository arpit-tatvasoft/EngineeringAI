//
//  PostsViewInteractor.swift
//  EngineeringAI_PracticalTest
//
//  Created by PCQ188 on 03/07/19.
//  Copyright © 2019 PCQ188. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct PostViewInteractor {
    
    //MARK:- Webservice Methods
    static func getPosts(page: Int) -> Observable<Response> {
        return Webservice.API.sendRequest(.posts(page))
    }
}
