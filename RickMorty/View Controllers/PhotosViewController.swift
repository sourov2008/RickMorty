//
//  PhotoViewController.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//

/**
 *  Load all the photos and represnt into a tabelview.
 *  Endless data load. Uses pagination.
 */
import UIKit
import Kingfisher


class PhotosViewController: UIViewController {

    var items = [ModelCharacterResults]()
    @IBOutlet weak var lblNoRecord: UILabel!
    var currentPaginationInfo: Pagination!
    var photoService = PhotoServiceCoordinator()

    @IBOutlet weak var tableView: UITableView!
 
    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Photos List"

        
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
        
        self.photoService.fetchPhotos(path: endpoint) { [weak self] responseData in
        
            
            print("")

            switch responseData {
            case .success(let res):
                print("")
 
                self?.items = res.results ?? []
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(NetworkError.APIError(let messeage )):
                self?.showToast(message: messeage, font: UIFont.systemFont(ofSize: 12))
            case .failure(NetworkError.BadURL(let messeage )):
                self?.showToast(message: messeage, font: UIFont.systemFont(ofSize: 12))
            case .failure(NetworkError.NoData(let messeage )):
                self?.showToast(message: messeage, font: UIFont.systemFont(ofSize: 12))
            case .failure(NetworkError.DecodingError(let messeage )):
                self?.showToast(message: messeage, font: UIFont.systemFont(ofSize: 12))
             }
         }
                
    }
    
    /**
     *  Merge data of all pages.
     *  @param responseObject: photo array [ModelPhotoDetails]
     *  @param paginationInfo: paginationInfo Pagination
     */


}


extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK - UITableView Delegates
    
    //    // MARK - UITableView Delegates
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "PhotoTableViewCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! PhotoTableViewCell
        
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

