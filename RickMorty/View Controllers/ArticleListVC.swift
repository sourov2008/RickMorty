//
//  CharacterViewController.swift
//  RickyMorty
//
//  Created by Shourob Datta on 11/02/22.
//
/**
 *  Load all the Characters and represnt into a tabelview.
 *  Added a UISearchController on navigation to perform search
 */
import UIKit
import Kingfisher

class ArticleListVC: UIViewController {

    var items = [ModelArtsResults]()
    @IBOutlet weak var lblNoRecord: UILabel!
    var characterService = ArticleServiceViewModel()
    @IBOutlet weak var tableView: UITableView!
 
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Arts Article"
        self.configureNavigationController()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200 // a number and not UITableView.automaticDimension

        // Search config
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        self.fetchCharacters()
    }
 
    /**
     *  Load your desierd page from API.
     *  @param searchText is your desired search text
     */
    func fetchCharacters(searchText : String = "")  {
        
        let endpoint = Endpoint.apiArts
        self.characterService.fetchCharacters(path: endpoint) { [weak self] response, success, error in
        
            guard success == true && response != nil else{
                self?.showToast(message: error ?? "error", font: UIFont.systemFont(ofSize: 12))
                
                self?.items.removeAll()
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.lblNoRecord.text = "Sorry, no records found"
                }
                return
            }
            
            self?.items = response?.results ?? []
            DispatchQueue.main.async {
                self?.lblNoRecord.text = ""
                self?.tableView.reloadData()
            }
 
         }
    }
}
// MARK - UISearchResultsUpdating Delegates
extension ArticleListVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        self.fetchCharacters(searchText: text)
    }
    
}
// MARK - UITableView Delegates
extension ArticleListVC: UITableViewDelegate, UITableViewDataSource {
        
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CharacterTableViewCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ArticleListCell
        cell.characterResult = items[indexPath.row]
        
        return cell
    }
    
    // UITableViewDelegate Method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        //return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let obj = ArticleDetailsVC.instantiateFromStoryboardMain()
        obj.details = items[indexPath.row] // default 0 is not safe because index number zero is possible. set a unrealistic default value
        self.navigationController?.pushViewController(obj, animated: true)
    }

    
}

