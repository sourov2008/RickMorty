//
//  PhotoTableViewCell.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel?
    @IBOutlet weak var img: UIImageView?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
