//
//  CharacterDetailsViewController.swift
//  RickMorty
//
//  Created by Shourob Datta on 11/02/22.
//  We uses table to take advandage of scrollview. In future contents might be bigger need a scroll view.

import UIKit
import Kingfisher

class CharacterDetailsViewController: UIViewController {

    var details : ModelArtsResults?

    @IBOutlet weak var ratio: NSLayoutConstraint!
    
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSeeMore: UIButton!

    @IBOutlet weak var img: UIImageView!

    var characterID: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateUI()
    }
    
}

// MARK: Class funciton
extension CharacterDetailsViewController{
    
 
    
    func updateUI( )  {
        
        self.title = details?.subsection?.capitalized
        self.lblDes.text = details?.abstract        
        
        self.lblTitle.text = details?.title
        self.lblAuthor.text = details?.byline
        
        if (details?.multimedia?.count ?? 0) > 0{
            if let imageURL =  URL(string: details?.multimedia?[0].url ?? "" ){
                self.img?.kf.setImage(with: imageURL)
                self.img.layoutSubviews()
            }
        }

    }
    
 
}
class ScaledHeightImageView: UIImageView {

    
    // Dynamically changes the size of imageview.
    override var intrinsicContentSize: CGSize {

        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width

            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio

            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        return CGSize(width: -1.0, height: -1.0)
    }
}
 
