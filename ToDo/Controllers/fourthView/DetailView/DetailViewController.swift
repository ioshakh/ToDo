//
//  DetailViewController.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/16.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController  {
    
   
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    private let realm = try! Realm()
    public var completion:(() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        textField.delegate = self
        datePicker.setDate(Date(), animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didsave))
       
    }
    
    
    @objc func didsave() {
        
        if let text = textField.text , !text.isEmpty {
            let date = datePicker.date
           
            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()
            completion?()
            
          navigationController?.popViewController(animated: true)
        }
        else {
            print("Add something")
        }
    }
}
    



extension DetailViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
