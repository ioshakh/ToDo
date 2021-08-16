//
//  ViewViewController.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/16.
//

import UIKit
import RealmSwift

class ViewViewController: UIViewController {
    
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    private let realm = try! Realm()
    public var item : ToDoListItem?
    public var deletionHandler : (() -> Void )?
    
    
    
    static let dateFormatter  : DateFormatter = {
        let dateFormatter  = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }
    
    
    func addView() {
        textLable.text = item?.item
        dateLable.text = Self.dateFormatter.string(from: item!.date)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash , target: self , action: #selector(didTappedDelete))
    }
    
    
    @objc func didTappedDelete() {
        guard let myitem = self.item else {
            return
        }
        realm.beginWrite()
        
        realm.delete(myitem)
        try! realm.commitWrite()
        
        deletionHandler?()
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
