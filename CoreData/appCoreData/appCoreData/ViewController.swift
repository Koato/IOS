//
//  ViewController.swift
//  appCoreData
//
//  Created by Koat on 6/22/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit

var task = [String]()

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tblData: UITableView!
    @IBAction func addTask(sender: AnyObject){
        let alert = UIAlertController(title: "Nueva tarea", message: "Agrega una nueva tarea", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .default, handler:{(action: UIAlertAction) -> Void in
            let textfield = alert.textFields!.first
            task.append(textfield!.text!)
            self.tblData.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler:{(action: UIAlertAction) -> Void in})
        
        alert.addTextField{(textField: UITextField) -> Void in}
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblData.register(UITableViewCell.self, forCellReuseIdentifier:"Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "Cell")
        cell!.textLabel!.text = task[indexPath.row]
        return cell!
    }

}

