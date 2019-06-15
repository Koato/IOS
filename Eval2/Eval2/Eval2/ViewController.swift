//
//  ViewController.swift
//  Eval2
//
//  Created by Koat on 5/25/19.
//  Copyright © 2019 Koat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnBounce: UIButton!
    @IBOutlet weak var btnJump: UIButton!
    @IBOutlet weak var btnShine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnBounce.round()
        btnJump.round()
        btnShine.round()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //está a punto de ser mostrada en la pantalla
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //presentación de la vista
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //llamado antes de que la vista sea realmente eliminada o cubierta
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //despido u ocultar de la vista
        super.viewDidDisappear(animated)
    }
    
    @IBAction func btnBounce(_ sender: Any) {
        btnBounce.rebote()
    }
    
    @IBAction func btnJump(_ sender: Any) {
        btnJump.salta()
    }
    
    @IBAction func btnShine(_ sender: Any) {
        btnShine.brilla()
    }
}
