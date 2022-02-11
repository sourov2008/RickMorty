//
//  CharacterViewController.swift
//  RickyMorty
//
//  Created by Shourob Datta on 29/1/22.
//

/**
 *  Load all the photos and represnt into a tabelview.
 *  Endless data load. Uses pagination.
 */
import UIKit
import Kingfisher


class CharacterViewController: UIViewController {

    var items = [ModelCharacterResults]()
    @IBOutlet weak var lblNoRecord: UILabel!
    var currentPaginationInfo: Pagination!
    var photoService = CharacterServiceCoordinator()

    @IBOutlet weak var tableView: UITableView!
 
    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Rick And Morty"

        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 70
        tableView.backgroundColor = UIColor.clear
        //tableView.separatorColor = UIColor.clear
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        self.fetchCharacters()
    }

 
    /**
     *  Load your desierd page from API . Related to pagination
     *  @param pageNo: is your desired page
     */
    func fetchCharacters()  {
        
        let endpoint = Endpoint.characterList
        
        
        self.photoService.fetchCharacters(path: endpoint) { [weak self] response, success, error in
        
            guard success == true && response != nil else{
                self?.showToast(message: error ?? "error", font: UIFont.systemFont(ofSize: 12))
                 return
            }
            
            self?.items = response?.results ?? []
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
 
         }

                
    }
    
    /**
     *  Merge data of all pages.
     *  @param responseObject: photo array [ModelPhotoDetails]
     *  @param paginationInfo: paginationInfo Pagination
     */


}


extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK - UITableView Delegates
    
    //    // MARK - UITableView Delegates
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "CharacterTableViewCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CharacterTableViewCell
        
        cell.characterResult = items[indexPath.row]
        
        return cell
    }
    
    // UITableViewDelegate Method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return UITableView.automaticDimension
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let details = CharacterDetailsViewController.instantiateFromStoryboardMain()
        details.characterID = items[indexPath.row].id ?? -123
        self.navigationController?.pushViewController(details, animated: true)
        
    }
    
 
    
}

