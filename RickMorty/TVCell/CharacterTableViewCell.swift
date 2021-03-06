//
//  CharacterTableViewCell.swift
//  RickyMorty
//  Created by Shourob Datta on 11/02/22.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel?
    @IBOutlet weak var img: UIImageView?
    @IBOutlet weak var lblEpisodeCount: UILabel?

    
    var characterResult: ModelCharacterResults?{
        
        didSet{
            
            lbltitle?.text = characterResult?.name
            
            if let imageURL =  URL(string: characterResult?.image ?? "" ){
                
                self.img?.kf.setImage(with: imageURL)
            }
            
            lblEpisodeCount?.text = "Total episodes : " + (characterResult?.episode?.count.description)!

        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
