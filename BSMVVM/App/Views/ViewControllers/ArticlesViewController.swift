//
//  ArticlesViewController.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseViewController<ArticlesViewModel> {

    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var filterButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupUI()
        viewModel.getArticles()
    }
    
    func setupUI() {
        ProgressOverlay.sharedInstance.showProgressIndecator()
    }
    
    func setupBinding() {
        viewModel.articles.asObservable().do(onNext: { (_) in
            ProgressOverlay.sharedInstance.hideProgressIndicator()
        }).bind(to: tableView.rx.items(cellIdentifier: R.reuseIdentifier.articleCell.identifier, cellType: ArticleCell.self)) { _, model, cell in
            let viewModel = AppDelegate.mainAssembler.resolver.resolve(ArticleViewModel.self, argument: model)!
            cell.configureCell(with: viewModel)
            }.disposed(by: disposeBag)
        
        filterButton.rx.tap.bind { [weak self] in
            guard let self = self else {
                return
            }
            self.showActionSheet()
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Article.self)
            .subscribe(onNext: { [weak self] model in
                let viewModel = AppDelegate.mainAssembler.resolver.resolve(ArticleViewModel.self, argument: model)!
                let articleDetailsViewController = R.storyboard.main.articleDetailsViewController()!
                articleDetailsViewController.viewModel = viewModel
                self?.navigationController?.pushViewController(articleDetailsViewController, animated: true)
            }).disposed(by: disposeBag)
        
        // Deselect the selected tableview cell
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            }).disposed(by: disposeBag)
    }
    
    private func showActionSheet() {
        let latest = RxDefaultAlertAction.init(title: "Latest", style: .default, result: RxDefaultAlertAction.Result.latest)
        let lastWeek = RxDefaultAlertAction.init(title: "Last Week", style: .default, result: RxDefaultAlertAction.Result.lastWeek)
        let lastMonth = RxDefaultAlertAction.init(title: "Last Month", style: .default, result: RxDefaultAlertAction.Result.lastMonth)
        let cancel = RxDefaultAlertAction.init(title: "Cancel", style: .destructive, result: RxDefaultAlertAction.Result.cancel)
        let title = "Articles Period"
        let message = "Choose the article period"
        let actions = [latest, lastWeek, lastMonth, cancel]
        let alertObservable = UIAlertController.rx_presentAlert(viewController: self, title: title, message: message, preferredStyle: .actionSheet, animated: true, actions: actions)
        alertObservable.subscribe(onNext: { [weak self] (result) in
            guard let self = self else {
                return
            }
            if let period = result.getPeriod() {
                self.setupUI()
                self.viewModel.getArticles(period: period)
            }
        }).disposed(by: disposeBag)
    }
}
