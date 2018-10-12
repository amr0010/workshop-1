//
//  ViewController.swift
//  Network_Workshop#1
//
//  Created by Amr on 10/12/18.
//  Copyright © 2018 Amr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var timeL = [timeLine]()
    {
        didSet {
            self.myTableView.reloadData()
        }
    }
    @IBOutlet weak var myTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
 getData()
    }
    
    func getData() {
        loadingIndicator.startAnimating()
        NetworkManager.startNetworking { (data, err) in
            if let error = err {
                print("error here \(error)")
                self.loadingIndicator.stopAnimating()
            }
            if let reponse = data {
                DispatchQueue.main.async {
                    self.timeL = reponse
                    self.loadingIndicator.stopAnimating()
                }
                
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDelegate ,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell
        cell.configure(with: timeL[indexPath.row])
        return cell
    }
    
    
}

