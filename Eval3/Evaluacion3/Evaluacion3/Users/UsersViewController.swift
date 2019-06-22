//
//  UsersViewController.swift
//  Evaluacion3
//
//  Created by Koat on 6/15/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var TblJson: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.TblJson.rowHeight = UITableView.automaticDimension
        self.TblJson.estimatedRowHeight = 50
        self.TblJson.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        fetchUsersData()
    }
    
    func fetchUsersData() {
        DispatchQueue.main.async {
            Alamofire.request("http://api/androidhive.info/contacts").respondeJSON(completionHandler:{
                (responde) in switch responde.result{
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
            as! UsersTableViewCell
        return cell
    }
}
