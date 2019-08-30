//
//  ExtensionFavoriteTableViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 29/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import UIKit

extension FavoriteTableViewController: ManageCoreDataDelegate {
    func alertWithCoreData(error: ErrorMessage) {
        presentAlert(error: error)
    }
}

extension FavoriteTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
