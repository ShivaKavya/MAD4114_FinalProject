//
//  ViewController.swift
//  MAD4114_FinalProject
//
//  Created by Shiva Kavya on 2018-07-25.
//  Copyright © 2018 Shiva Kavya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let folderList = ["All Notes","",""];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return folderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "folderListItemCell", for: indexPath)
        
        cell.textLabel?.text = folderList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(folderList[indexPath.row]);
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func NFButtonAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "New Folder", message: "Enter a name for this folder.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Name"
        })
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
                let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextVC = myStoryBoard.instantiateViewController(withIdentifier: "notes") as! notesViewController
                self.present(nextVC, animated: true, completion: nil)
            }
        }))
        
        self.present(alert, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

