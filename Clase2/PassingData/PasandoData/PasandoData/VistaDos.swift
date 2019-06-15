//
//  VistaDos.swift
//  PasandoData
//
//  Created by Koat on 4/20/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import Foundation
import 	UIKit

class VistaDos: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    var labelText = String()
    
    override func viewDidLoad() {
        Label.text = labelText
    }
}
