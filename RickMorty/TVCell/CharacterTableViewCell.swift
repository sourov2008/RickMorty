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

    
    var characterResult: ModelArtsResults?{
        
        didSet{
            
            lbltitle?.text = characterResult?.title
            
            if characterResult?.multimedia?.count ?? 0 >= 3{
                
                if let imageURL =  URL(string: characterResult?.multimedia?[1].url ?? "" ){
                    self.img?.kf.setImage(with: imageURL)
                }
            }

            lblEpisodeCount?.text =  characterResult?.byline ?? ""

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
