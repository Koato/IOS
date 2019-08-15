//
//  ViewController.swift
//  ExamenFinal
//
//  Created by Koat on 7/6/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit
import CoreData
var tasks = [NSManagedObject]()

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var lblIntentos: UILabel!
    @IBOutlet weak var lblRegistros: UILabel!
    @IBOutlet weak var lblUltimo: UILabel!
    @IBOutlet weak var btnRegistrar: UIButton!
    @IBOutlet weak var btnBorrar: UIButton!
    var score = 0
    var data = 0
    
    @IBAction func borrarRegistros(_ sender: AnyObject) {
        deleteTasks()
    }
    
    @IBAction func agregarRegistro(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Nuevo Registro",
                                      message: "Agrega un nuevo registro",
                                      preferredStyle: .alert)
        
        //Creamos el UIAlertAction que nos permitirá guardar la tarea
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        //Guardamos el texto del textField en el array tasks y recargamos la table view
                                        let textField = alert.textFields!.first
                                        // tasks.append(textField!.text!)
                                        self.saveTask(nameTask: textField!.text!)
        })
        
        //Creamos el UIAlertAction que nos permitirá cancelar
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        //Añadimos el TextField al UIAlertController
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        score+=1
        lblIntentos.text = "\(score)"
        //Añadimos las dos UIAlertAction que hemos creado al UIAlertController
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        //Lanzamos el UIAlertController
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //Creamos un objeto task que recuperamos del array tasks
        let task = tasks[indexPath.row]
        //Con KVC obtenemos el contenido del atributo "name" de la task y lo añadimos a nuestra Cell
        cell!.textLabel!.text = task.value(forKey: "name") as? String
        
        return cell!
    }
    
    func saveTask(nameTask:String){
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)
        let task = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //3
        task.setValue(nameTask, forKey: "name")
        
        //4
        do {
            try managedContext.save()
            //5
            tasks.append(task)
        } catch let error as NSError {
            print("No ha sido posible guardar \(error), \(error.userInfo)")
        }
        data+=1
        lblRegistros.text = "\(score)"
        lblUltimo.text = nameTask
    }
    
    func deleteTasks(){
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)
        let task = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //3
//        task.validateForDelete()
        
        //4
        do {
            try managedContext.save()
            //5
            tasks.append(task)
        } catch let error as NSError {
            print("No ha sido posible guardar \(error), \(error.userInfo)")
        }
        lblUltimo.text = ""
        lblRegistros.text = "0"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblIntentos.text = "0"
        lblRegistros.text = "0"
        lblUltimo.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let fetchRequest : NSFetchRequest<Task> = Task.fetchRequest()
        
        // 3
        do {
            let results = try managedContext.fetch(fetchRequest)
            tasks = results as [NSManagedObject]
        } catch let error as NSError {
            print("No ha sido posible cargar \(error), \(error.userInfo)")
        }
    }
}
