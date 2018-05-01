//
//  TVCnote.swift
//  iNoter
//
//  Created by Filip Sikora on 01/12/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit

class TVCnote: UITableViewCell {

    @IBOutlet weak var laTitile: UILabel!
    
    @IBOutlet weak var laDescription: UITextView!
    
    @IBOutlet weak var buDelete: UIButton!
    
    @IBOutlet weak var laDate: UILabel!
    
    
    func addNote(note:Notes){
        laTitile.text = note.title
        laDescription.text = note.body
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM/dd/yy h:mm a"
        let currentDate = formatDate.string(from: note.date_current as! Date)
        laDate.text = currentDate
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
