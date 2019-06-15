//
//  ViewController.swift
//  PasandoData
//
//  Created by Koat on 4/20/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func 	prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestinoController : VistaDos = segue.destination  as! VistaDos
        DestinoController.labelText = TextField.text!
    }

}

