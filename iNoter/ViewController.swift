//
//  ViewController.swift
//  iNoter
//
//  Created by Filip Sikora on 29/11/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textTitle: UITextField!
    
    
    @IBOutlet weak var textBody: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSave(_ sender: Any) {
        
        let note = Notes(context: context)
        note.title = textTitle.text
        note.body = textBody.text
        note.date_current = NSDate() as Date
        apDel.saveContext()
        textTitle.text = ""
        textBody.text = ""
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
    }
}

