//
//  ArticleDetailsViewController.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: BaseViewController <ArticleViewModel> {

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var authorLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var abstractLabel: UILabel!
    @IBOutlet weak private var goToLinkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    func setupUI() {
        titleLabel.text = viewModel.article.title
        authorLabel.text = viewModel.article.byline
        dateLabel.text = viewModel.article.publishedDate
        KingFisherFacade.shared.setImageView(imageView, withURLString: viewModel.getLargeImageURLString())
        abstractLabel.text = viewModel.article.abstract
    }

    func setupBindings() {
        goToLinkButton.rx.tap.bind { [weak self] in
            guard let self = self else {
                return
            }
            self.openLinkInBroswer(link: self.viewModel.article.url)
            }.disposed(by: disposeBag)
    }
    
    private func openLinkInBroswer(link: String?) {
        if link == nil {
            return
        }
        guard let url = URL(string: link!) else { return }
        UIApplication.shared.open(url)
    }
}
