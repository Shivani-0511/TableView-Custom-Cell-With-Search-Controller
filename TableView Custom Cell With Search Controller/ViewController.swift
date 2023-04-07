//
//  ViewController.swift
//  TableView Custom Cell With Search Controller
//
//  Created by Apple on 04/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var listCat = [CatData]()
    var searching = false
    var searchCat = [CatData]()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        let cat1 = CatData(cName: "Luna", cAge: "1 Year", cImage: "1")
        listCat.append(cat1)
        
        let cat2 = CatData(cName: "Charlie", cAge: "2 Year", cImage: "2")
        listCat.append(cat2)
        
        let cat3 = CatData(cName: "Simba", cAge: "3 Year", cImage: "3")
        listCat.append(cat3)
        
        let cat4 = CatData(cName: "Bella", cAge: "4 Year", cImage: "4")
        listCat.append(cat4)
        
        let cat5 = CatData(cName: "Nala", cAge: "5 Year", cImage: "5")
        listCat.append(cat5)
        
        let cat6 = CatData(cName: "Lucy", cAge: "6 Year", cImage: "6")
        listCat.append(cat6)
        
        let cat7 = CatData(cName: "Angel", cAge: "7 Year", cImage: "7")
        listCat.append(cat7)
        
        let cat8 = CatData(cName: "Oreo", cAge: "8 Year", cImage: "8")
        listCat.append(cat8)
        
        let cat9 = CatData(cName: "Milo", cAge: "9 Year", cImage: "9")
        listCat.append(cat9)
        configureSearchController()
    }
private func configureSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Player By Name"
        
    }
    

}
extension ViewController : UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchCat.count
        }else{
            return listCat.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if searching{
            cell.name.text = searchCat[indexPath.row].catName
            cell.year.text = searchCat[indexPath.row].catAge
            cell.myImage.image = UIImage(named: searchCat[indexPath.row].catPhoto)
            
        }else{
            cell.name.text = listCat[indexPath.row].catName
            cell.year.text = listCat[indexPath.row].catAge
            cell.myImage.image = UIImage(named: listCat[indexPath.row].catPhoto)
        }
        return cell
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchCat.removeAll()
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchCat.removeAll()
            for cat in listCat
            {
                if cat.catName.lowercased().contains(searchText.lowercased())
                {
                    searchCat.append(cat)
                }
            }
            
            
        
    }else{
        searching = false
        searchCat.removeAll()
        searchCat=listCat
    }
    
        tableView.reloadData()
}
}
