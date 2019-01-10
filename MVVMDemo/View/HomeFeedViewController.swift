//
//  HomeFeedViewController.swift
//  MVVMDemo
//
//  Created by Tushar  Jadhav on 2019-01-09.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "CellIdentifier"

    let viewModel = HomeFeedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //Set table view cell and dynamic height of cell
        setUpTableView()
        
        //Fetch Game list api method
        fetchVideosList()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UI Setup methods
    
    func setUpTableView()  {
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.tableFooterView = UIView()
    }
    
    // MARK: - Web service methods
    
    func fetchVideosList()  {
        
        self.viewModel.fetchHomeFeedData { sucess in
            
            if !sucess {
                let alert = UIAlertController(title: "Error", message: "Please check your internet connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            //Show data into tableview
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension HomeFeedViewController : UITableViewDataSource {
    // MARK: - UITableView Datasource methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeFeedCell
        cell.model = self.viewModel.dataModelArray[indexPath.row]
        
        return cell
    }
}

