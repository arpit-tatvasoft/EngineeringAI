//
//  PostViewModel.swift
//  EngineeringAITest
//
//  Created by PCQ185 on 08/10/19.
//  Copyright © 2019 Tatvasoft. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

final class PostListViewModel {
    
    let disposeBag = DisposeBag()
    var posts = BehaviorRelay<[Post]>(value: [])
    var state = PublishSubject<ViewModelState<PostListViewModel>>()
    var nextPage: Int = 1
    
    var postList: BehaviorRelay<[PostListViewModel]> = .init(value: [])
    var selectedPost:Int = 0
    var pageNumber:Int = 1
}

extension PostListViewModel {
    
    func getPostList(page:Int) {
        PostViewInteractor.getPosts(page: page).subscribe(onNext: { [weak self] response in
            guard let `self` = self else { return }
            if let posts = response.data as? [Post] {
                if posts.count == 0 {
                    self.state.onNext(.failure(.unknown))
                    print("No more new posts")
                } else {
                    if self.posts.value.count == 0 {
                        self.posts.accept(posts)
                    } else {
                        self.posts.accept(self.posts.value + posts)
                    }
                    
                    self.state.onNext(.success(self))
                    self.pageNumber = self.pageNumber + 1
                }
            } else {
                self.postList.accept([])
                self.state.onNext(.failure(.noData))
            }
            }, onError: { [weak self] error in
                guard let `self` = self else { return }
                self.postList.accept([])
                self.state.onNext(.failure(error as! WebError))
            }, onCompleted: { [weak self] in
                guard let `self` = self else { return }
                self.state.onNext(.finish(false))
        }).disposed(by: disposeBag)
    }
}
