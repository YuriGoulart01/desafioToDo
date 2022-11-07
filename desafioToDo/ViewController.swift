//
//  ViewController.swift
//  desafioToDo
//
//  Created by Yuri Goulart de Oliveira on 07/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func addButton() {
        alert()
    }
    
    func alert () {
        let alert = UIAlertController (title: "Entre com a tarefa", message: nil, preferredStyle: .alert)
        alert.addTextField { text in
            text.placeholder = "Entre com a tarefa"
        }
        alert.addTextField{ text in
            text.placeholder = "Entre com a descrição"
        }
        let submitButton = UIAlertAction(title: "Adicionar", style: .default) { (_) in
            guard let task = alert.textFields?[0].text, let description = alert.textFields?[1].text, !task.isEmpty, !description.isEmpty else {return}
            self.data.append(Task(title: task, description: description))
            self.tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "Cancelar", style: .default){ (_) in
        }
        
        alert.addAction(submitButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellClass
        let data = data[indexPath.row]
        
        cell.setTaskLabel(text: data.title)
        cell.setDescriptionLabel(text: data.description)
        
        return cell
    }
    
    func tableView( _ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _,_,_  in
            self.data.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = UIColor.red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
}

