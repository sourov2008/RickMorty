//
//  CharacterViewController.swift
//  RickyMorty
//
//  Created by Shourob Datta on 29/1/22.
//
/**
 *  Load all the Characters and represnt into a tabelview.
 *  Added a UISearchController on navigation to perform search
 */
import UIKit
import Kingfisher

class CharacterViewController: UIViewController {

    var items = [ModelCharacterResults]()
    @IBOutlet weak var lblNoRecord: UILabel!
    var characterService = CharacterServiceCoordinator()
    @IBOutlet weak var tableView: UITableView!
 
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rick And Morty"
        self.configureNavigationController()

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
        
        let endpoint = Endpoint.characterList.replacingOccurrences(of: "{search}", with: searchText)
        self.characterService.fetchCharacters(path: endpoint) { [weak self] response, success, error in
        
            guard success == true && response != nil else{
                self?.showToast(message: error ?? "error", font: UIFont.systemFont(ofSize: 12))
                
                self?.items.removeAll()
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                return
            }
            
            self?.items = response?.results ?? []
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
 
         }
    }
}
// MARK - UISearchResultsUpdating Delegates
extension CharacterViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        self.fetchCharacters(searchText: text)
    }
    
}
// MARK - UITableView Delegates
extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
        
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

