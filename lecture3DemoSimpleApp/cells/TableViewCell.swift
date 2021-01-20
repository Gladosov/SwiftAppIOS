//
//  TableViewCell.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell, UITableViewDelegate{
   

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var switchDoneInP: UISwitch!
    @IBOutlet weak var subTitle1: UILabel!
    
    
    var delegate: SecondViewController?
    var id = 0



    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        
       }
   
    
    
}
