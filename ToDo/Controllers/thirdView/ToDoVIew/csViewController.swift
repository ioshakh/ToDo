//
//  csViewController.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/15.
//
import FirebaseAuth
import UIKit
import RealmSwift
import SideMenu



class csViewController: UIViewController  {
    
  @IBOutlet weak var tableview: UITableView!
    
  private var data = [ToDoListItem]()
  private let realm = try! Realm()
  public var completion:(() -> Void)?
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    
    //Mark : - Functions and Actions
    
    func addViews() {
        data = realm.objects(ToDoListItem.self).map({$0})
        tableview.delegate = self
        tableview.dataSource = self
        
        let img = UIImage(systemName: "plus")
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: img , style: .plain, target: self, action: #selector(didselect))
    }
        

    @objc func didselect() {
        let cv = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        cv.completion = { [weak self] in
            self!.refresh()
        }
        cv.title = "title"
        self.navigationController?.pushViewController(cv, animated: true)
    }
    
    
    
    func refresh() {
        data = realm.objects(ToDoListItem.self).map({$0})
        tableview.reloadData()
    }
    
    
  
}

extension csViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = data[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("DataTableViewCell", owner: self, options: nil)?.first as! DataTableViewCell
        
        cell.label.text = item.item
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        
        let cv = ViewViewController(nibName: "ViewViewController", bundle: nil)
        
        cv.item = item
        cv.deletionHandler = {[weak self] in
            self?.refresh()
        }
        
        cv.title = item.item
        
        navigationController?.pushViewController(cv, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
   
}
