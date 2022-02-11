//
//  SearchViewController.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//
/**
 *  This class is dedicated for search purpose.
 *  We also represents search history.
 *  @Further feature could be implemented like delete the search history
 */
import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var txtSearch: UITextField!
    private let searchValidation = SearchValidationService ()
    @IBOutlet weak var tableView: UITableView!
    let searchObj = SearchHistoryService()
    
    var items = [ModelSearchHistory]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationController()
        self.title = "Photo App"
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 70
        tableView.backgroundColor = UIColor.clear
        tableView.keyboardDismissMode = .onDrag


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        items = searchObj.retriveSearchedArray().reversed()
        self.tableView.reloadData()

    }
    
    
    @IBAction func btnActionSearch(_ sender: Any) {
        
        self.txtSearch.endEditing(true)
        
        do{
            // Save the search value & push into Photos view controller
            let searchText = try searchValidation.validiateSearch(text: txtSearch.text)
            let obj = PhotosViewController.instantiateFromStoryboardMain()
            obj.searchText = searchText.trimmingCharacters(in: .whitespaces)
            self.navigationController?.pushViewController(obj, animated: true)
            // save in search history.
            saveSearchHistory(value: searchText.trimmingCharacters(in: .whitespaces))
            
        }catch{
            
            self.showToast(message: error.localizedDescription, font: UIFont.systemFont(ofSize: 14))

        }
        
    }
    
    func saveSearchHistory(value: String)  {

        var searchArr = searchObj.retriveSearchedArray()
        searchArr.append(ModelSearchHistory(searchTitle: value, date: Date()))
        searchObj.saveSearchArray(arr: searchArr)
        
        
    }
    
 
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK - UITableView Delegates
        
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.items.count > 0 ? "Recent Search" : ""
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "SearchHistoryTableViewCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SearchHistoryTableViewCell
        
        cell.lbltitle?.text = items[indexPath.row].searachTitle
        
        
        return cell
    }
    
    // UITableViewDelegate Method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return UITableView.automaticDimension
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = PhotosViewController.instantiateFromStoryboardMain()
        obj.searchText = items[indexPath.row].searachTitle ?? "recent"
        self.navigationController?.pushViewController(obj, animated: true)

    }
 
    
}
