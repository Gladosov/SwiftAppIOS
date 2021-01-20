//
//  EditViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by Nurba on 20.01.2021.
//

import UIKit

class EditViewController: UIViewController {
    
    
    var delegate:SecondViewControllerDelegate?
    
    var nDeadline:String?
    
    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var newDatePicker: UIDatePicker!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        newDatePicker.addTarget(self, action: #selector(dateAction(_ :)), for: .valueChanged)
        
    }
    
    @IBAction func dateAction(_ sender: UIDatePicker) {
        
        
        let datefor = DateFormatter()
        datefor.dateFormat = "xx.XX.xxxx"
        let aDeadline = datefor.string(from: sender.date)
        
        nDeadline = aDeadline
    }
    
    @IBAction func edit(_ sender: Any) {
       
        delegate?.editItem(1, ToDo:ToDoItem( title: newTitle.text, deadLine: nDeadline ))
        
        navigationController?.popViewController(animated: true)
    }
}
