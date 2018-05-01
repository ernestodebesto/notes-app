//
//  VCmyList.swift
//  iNoter
//
//  Created by Filip Sikora on 01/12/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit
import CoreData

class VCmyList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvNotesList: UITableView!
    
    var allNotes = [Notes]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCnote = tableView.dequeueReusableCell(withIdentifier: "cellNote", for: indexPath) as! TVCnote
        cell.addNote(note: allNotes[indexPath.row])
        cell.buDelete.tag = indexPath.row
        
        cell.buDelete.addTarget(self, action: #selector(buDeleteClick(_ :)), for: .touchUpInside )

        return cell
    }
    
    @objc func buDeleteClick(_ sender: UIButton){
        context.delete(allNotes[sender.tag])
        loadNotes()
    }
    
    func loadNotes() {
        let fetchRequest:NSFetchRequest<Notes> =  Notes.fetchRequest()
        do {
             allNotes = try context.fetch(fetchRequest)
            tvNotesList.reloadData()
        }catch {
            print("blad bazdy danych")
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        tvNotesList.delegate = self
        tvNotesList.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
