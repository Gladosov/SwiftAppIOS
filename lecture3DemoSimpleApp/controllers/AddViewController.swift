//
//  AddViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by Nurba on 20.01.2021.
//

import UIKit



class AddViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate:SecondViewControllerDelegate?
    var newDeadline:String?
  

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(dateAction(_ :)), for: .valueChanged)

    }
    
    @IBAction func dateAction(_ sender: UIDatePicker) {
        
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd.MM.yyyy"
        let Deadline = dateformat.string(from: sender.date)
        
        newDeadline = Deadline
    }

    @IBAction func saveButton(_ sender: Any) {
    
        delegate?.add(ToDo:ToDoItem( title: titleField.text, deadLine:newDeadline ))
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}



