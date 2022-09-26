//
//  TableViewCell.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var cellViewModel: MovieCellViewModel? {
        didSet {
            titleLabel.text = cellViewModel?.title
            descriptionLabel.text = cellViewModel?.description
            if let imagePath = cellViewModel?.imageFullPath, let imageUrl = URL(string: imagePath){
                movieImage.load(url: imageUrl)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
