//
//  ArticleCell.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak private var articleImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var authorLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    func configureCell(with viewModel: ArticleViewModel) {
        titleLabel.text = viewModel.article.title
        authorLabel.text = viewModel.article.byline
        dateLabel.text = viewModel.article.publishedDate
        KingFisherFacade.shared.setImageView(articleImageView, withURLString: viewModel.getThumbnailURLString())
    }
}
