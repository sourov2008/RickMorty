//
//  CharacterDetailsViewController.swift
//  RickMorty
//
//  Created by Shourob Datta on 11/02/22.
//  We uses table to take advandage of scrollview. In future contents might be bigger need a scroll view.

import UIKit
import Kingfisher

class CharacterDetailsViewController: UIViewController {

    var detailsService = CharacterDetailsServiceCoordinator()

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblCurrentLocation: UILabel!
    @IBOutlet weak var img: UIImageView!

    var characterID: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        retriveCharacterByUsing(id: characterID)
    }
    
}

// MARK: Class funciton
extension CharacterDetailsViewController{
    
    // Fetch character details from web API
    func retriveCharacterByUsing(id: Int)  {
        let endpoint = Endpoint.characterDetails.replacingOccurrences(of: "{id}", with: id.description)
        detailsService.fetchCharacterDetails(path: endpoint) { [weak self] response, success, error in
            
            guard success == true && response != nil else{
                self?.showToast(message: error ?? "error", font: UIFont.systemFont(ofSize: 12))
                 return
            }
            
            // success then update UI
            self?.updateUI(details: response!)
            
        }

    }
    
    func updateUI( details: ModelCharacterDetailsBaseClass)  {
        
        self.lblName.text = details.name
        self.lblSpecies.text = details.species
        self.lblStatus.text = details.status
        self.lblCurrentLocation.text = details.location?.name
        self.lblGender.text = details.gender
        
        if let imageURL =  URL(string: details.image ?? "" ){
            self.img?.kf.setImage(with: imageURL)
            
        }
     
    }
    
}
