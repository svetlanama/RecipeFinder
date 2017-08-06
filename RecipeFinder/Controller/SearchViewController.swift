//
//  SearchViewController.swift
//  RecipeFinder
//
//  Created by Svitlana Moiseyenko on 8/6/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    static let nibName = "SearchCell"
    static let cellIdentifier = "SearchCellID"
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchDebouncer = debounce1(
        delay: .milliseconds(Constants.debounceDelay),
        action: { (callback: () -> ()) in
            callback()
    })
    
    var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: SearchViewController.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SearchViewController.cellIdentifier)
        
        performSearch()
    }
    
    func performSearch(term: String = "") {
        searchDebouncer({ [weak self] in
            APIService.sharedInstance.getRecepies(searchText: term, comletion: { [weak self] result in
                self?.recipes = result
            })
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchViewController: UISearchBarDelegate, UISearchDisplayDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(term: searchText)
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewController.cellIdentifier) as! SearchCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.configureCell(forRecipe: recipes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
