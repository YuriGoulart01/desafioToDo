//
//  CellClass.swift
//  desafioToDo
//
//  Created by Yuri Goulart de Oliveira on 07/11/22.
//

import UIKit

class CellClass: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setTaskLabel (text: String) {
        taskLabel.text = text
    }
    func setDescriptionLabel (text: String) {
        descriptionLabel.text = text
    }
    
    @IBAction func removeButton() {
        
    }
}
