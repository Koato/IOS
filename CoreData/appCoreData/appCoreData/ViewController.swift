//
//  ViewController.swift
//  appCoreData
//
//  Created by Koat on 6/22/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit
import CoreData

var tasks = [NSManagedObject]()

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tblData: UITableView!
    @IBAction func addTask(sender: AnyObject){
        let alert = UIAlertController(title: "Nueva tarea", message: "Agrega una nueva tarea", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .default, handler:{(action: UIAlertAction) -> Void in
            let textfield = alert.textFields!.first
            //task.append(textfield!.text!)
            self.saveTask(name: textfield!.text!)
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
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "Cell")
        //cell!.textLabel!.text = task[indexPath.row]
        let tak = tasks[indexPath.row]
        cell!.textLabel!.text = tasks.value(forKey: "name") as? String
        
        return cell!
    }
    
    func saveTask(name: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)
        let task = NSManagedObject(entity: entity!, insertInto: managedContext)
        task.setValue(name, forKey: "name")
        do {
            try managedContext.save()
            tasks.append(task)
        } catch let error as NSError {
            print("No ha sido posible guardar la informacion \(error)")
        }
    }

}

