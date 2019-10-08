//
//  ViewController.swift
//  EngineeringAITest
//
//  Created by PCQ185 on 08/10/19.
//  Copyright © 2019 Tatvasoft. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostViewController: UIViewController, UIScrollViewDelegate {
    
    let viewModel = PostListViewModel()
    let disposBag = DisposeBag()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(PostViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    @IBOutlet weak var tableViewPosts: UITableView!
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupBinding()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Custom Method
    private func setupUI() {
        self.tableViewPosts.refreshControl = refreshControl
        tableViewPosts.rx.setDelegate(self).disposed(by: disposBag)
        self.viewModel.getPostList(page: self.viewModel.pageNumber)
        self.navigationItem.title = "Posts loading"
    }
    
    @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.viewModel.selectedPost = 0
        self.setTitle()
        self.viewModel.pageNumber = 1
        self.viewModel.getPostList(page:self.viewModel.pageNumber)
    }
    
    private func setTitle() {
        self.navigationItem.title = "Total posts loaded: \(self.viewModel.posts.value.count)"
    }
    
    private func setupBinding() {
        
        viewModel.posts.asObservable().bind(to: tableViewPosts.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { (_, post: Post, cell) in
            cell.post = post
            }.disposed(by: self.disposBag)
        
        viewModel.state.subscribe(onNext :{ state in
            switch state {
            case .loading:
                print("laoding")
            case .finish(let finishPaging):
                if finishPaging {
                    
                } else {
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            case .success:
                print("success")
                self.setTitle()
                self.viewModel.pageNumber += 1
                self.viewModel.getPostList(page: self.viewModel.pageNumber)
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
            }
        }).disposed(by: disposBag)
        
//        tableViewPosts.rx.willDisplayCell
//            .subscribe(onNext: { cell, indexPath in
//                if indexPath.row == self.viewModel.posts.value.count - 3 {
//                }
//            }).disposed(by: disposBag)
    }
}


extension PostViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
