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
    
    func configureCell(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.byline
        dateLabel.text = article.publishedDate
    }
}
