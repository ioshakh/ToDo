//Enter View
//Sign in with gmail


import UIKit
import RealmSwift

class HomeViewController: UIViewController {
  
    var item : [Slide] = []
    
    @IBOutlet weak var slideCollectionview: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initviews()
    }
    
  
    // Mark : - Functions
    
    func initviews() {
        slideCollectionview.delegate = self
        slideCollectionview.dataSource = self
        slideCollectionview.register(UINib(nibName: "SlideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        item = [Slide(image: "first", title: "Develop habits with Habit tracker") ,
                Slide(image: "second", title: "Set reminders and recurrences for tasks") ,
                Slide(image: "third", title: "Schedule tasks on Calendar")]
        
        
        // view slides page controller
        
        slideCollectionview.layer.shadowColor = UIColor.black.cgColor
        slideCollectionview.layer.borderWidth = 0.1
        slideCollectionview.layer.shadowOffset = .zero
        slideCollectionview.layer.shadowOpacity = 0.1
    }
    
    
    
    
    @IBAction func signActionEmail(_ sender: Any) {
        let cv = SignInViewController(nibName: "SignInViewController", bundle: nil)
        self.navigationController?.pushViewController(cv, animated: true)
    }
}


extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let items = item[indexPath.row]
        
        let cell = slideCollectionview.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! SlideCollectionViewCell
        
        cell.setup(items)
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        
        currentPage = Int(scrollView.contentOffset.x  / width )
        
        pageControl.currentPage = currentPage
    }
}
