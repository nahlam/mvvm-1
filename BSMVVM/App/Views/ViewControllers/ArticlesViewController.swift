//
//  ArticlesViewController.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseViewController<ArticlesViewModel> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupUI()
        viewModel.getArticles()
    }
    
    func setupUI() {
        // to start a progress
    }
    
    func setupBinding() {
        viewModel.articles.asObservable().do(onNext: { (articles) in
            // to stop a progress
        }).bind(to: tableView.rx.items(cellIdentifier: R.reuseIdentifier.articleCell.identifier, cellType: ArticleCell.self)) { _, model, cell in
            let viewModel = AppDelegate.mainAssembler.resolver.resolve(ArticleViewModel.self, argument: model)!
            cell.configureCell(with: viewModel)
            }.disposed(by: disposeBag)
    }

}
