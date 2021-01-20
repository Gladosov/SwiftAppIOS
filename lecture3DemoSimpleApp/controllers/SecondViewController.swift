//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit



protocol SecondViewControllerDelegate {
    func add(ToDo:ToDoItem)
    func editItem(_ id: Int, ToDo:ToDoItem)


}

class SecondViewController: UIViewController {

   
    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    let cellId = "TableViewCell"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
        
       
    }

    

 
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
       
        
    }
    
  
    @IBAction func Add(_ sender: UIBarButtonItem) {
        let avc = storyboard?.instantiateViewController(identifier: "add")as! AddViewController
        
        avc.delegate = self
        
        navigationController?.pushViewController(avc, animated: true)
        
    
       
    }
  
}


extension SecondViewController: SecondViewControllerDelegate{
    func editItem(_ id: Int, ToDo: ToDoItem) {
          
    }
    
 
    func add(ToDo: ToDoItem) {
        arr.append(ToDo)
        tableView.reloadData()
    }
    
  

    

    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
        cell.delegate = self
       
        cell.titleLabel.text = item.title
        cell.subTitleLabel.text = item.deadLine
     
    return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
               
        
               
               let evc = self.storyboard?.instantiateViewController(identifier: "edit") as! EditViewController
         
               
               self.navigationController?.pushViewController(evc, animated: true)
           
               evc.delegate = self
               
               
               print("Edit \(indexPath.row + 1)")
               completionHandler(true)
           }
           edit.backgroundColor = .blue
    
        let configuration = UISwipeActionsConfiguration(actions: [edit])
        return configuration
    }
          

    
 
            
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
                   self.arr.remove(at: indexPath.row)
                   self.tableView.deleteRows(at: [indexPath], with: .automatic)
                   complete(true)
        }
               
               deleteAction.backgroundColor = .red
               
    

        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
 
    

    
    
    
    }

        



}

