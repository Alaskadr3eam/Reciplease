//
//  ExtensioResultSearchTableViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 28/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import UIKit

extension ResultSearchTableViewController: ResultRequest {
    func resultOfSearch() {
        tableViewList.removeLoadingScreen(loadingView: loadingView, spinner: spinner, loadingLabel: loadingLabel)
        self.tableView.reloadData()
    }
    
    
    
    func resultAlert(error: errorMessage) {
        tableViewList.removeLoadingScreen(loadingView: loadingView, spinner: spinner, loadingLabel: loadingLabel)
        presentAlert(error: error)
        tableViewList.setEmptyMessage(Constant.messageSearchTableView)
    }
}
