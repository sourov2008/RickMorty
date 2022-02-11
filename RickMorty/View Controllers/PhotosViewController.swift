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
import PullToRefresh
import Kingfisher


class PhotosViewController: UIViewController {

    var items = [ModelPhotoDetails]()
    @IBOutlet weak var lblNoRecord: UILabel!
    var currentPaginationInfo: Pagination!
    var photoService = PhotoServiceCoordinator()

    @IBOutlet weak var tableView: UITableView!
    var searchText = ""

    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Photos List"

        setupPullToRefresh()
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 70
        tableView.backgroundColor = UIColor.clear
        //tableView.separatorColor = UIColor.clear
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        self.fetchFirstPage()
    }

    
    func fetchFirstPage() {
        fetchPageNo(pageNo: 1)
    }
    
    /**
     *  Load your desierd page from API . Related to pagination
     *  @param pageNo: is your desired page
     */
    func fetchPageNo(pageNo : Int)  {
        
        var endpoint = Endpoint.photoRetrive.replacingOccurrences(of: "{page}", with: "\(pageNo)")
        endpoint = endpoint.replacingOccurrences(of: "{text}", with: searchText)

        
        self.photoService.fetchPhotos(path: endpoint) { [weak self] responseData in
        
            switch responseData {
            case .success(let res):
                print("")
                
                let pagination = Pagination(pageCount:res.photos?.pages , count: res.photos?.total, currentPage: res.photos?.page)

                self?.processData(responseObject: res.photos?.photo, paginationInfo: pagination)

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

    func processData(responseObject: [ModelPhotoDetails]?, paginationInfo: Pagination) {
        
        if items.count > 0 && paginationInfo.currentPage == 1 {
            items.removeAll()
        }
        
        items.append(contentsOf: responseObject!)

//        for dict in responseObject!   {
//            items.append(dict)
//        }
//
        currentPaginationInfo = paginationInfo
        if items.count <= 0{
            lblNoRecord.text = "Sorry, no records found. Please search again"
         }
        
        
        tableView.reloadData()
        self.tableView.endRefreshing(at: .bottom)
        //self.tableView.endRefreshing(at: .top)
        
        
    }



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
        
        cell.lbltitle?.text = items[indexPath.row].title
        
        var endpoint = Endpoint.imageUrl.replacingOccurrences(of: "{farm}", with: "\(items[indexPath.row].farm ?? 0)")

        endpoint = endpoint.replacingOccurrences(of: "{server}", with: "\(items[indexPath.row].server ?? "0")")
        endpoint = endpoint.replacingOccurrences(of: "{id}", with: "\(items[indexPath.row].id ?? "0")")
        endpoint = endpoint.replacingOccurrences(of: "{secret}", with: "\(items[indexPath.row].secret ?? "0")")

         
 
        let url = URL(string: endpoint)
        cell.img?.kf.setImage(with: url)
        
        
        return cell
    }
    
    // UITableViewDelegate Method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return UITableView.automaticDimension
        return 110
    }
    
 
    
}

 extension PhotosViewController {
    
    func setupPullToRefresh() {

        tableView.addPullToRefresh(PullToRefresh(position: .bottom)) { [weak self] in
            
            if (self?.currentPaginationInfo != nil) && self?.currentPaginationInfo.pageCount ?? 0  > 1  {
                self?.fetchPageNo(pageNo: (self?.currentPaginationInfo.currentPage!)! + 1)
            } else {
                self?.tableView.endRefreshing(at: .bottom)
                //UtilitySwift.showToastMessage(message: "No more data available")
                
            }
            
        }
    }
 
}
