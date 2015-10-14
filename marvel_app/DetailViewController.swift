
import Foundation
import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailWebview = UIWebView()

  var detailUrl:String = ""
  
  convenience init(detailUrl: String){
    self.init()
    self.detailUrl = detailUrl
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    detailWebview!.loadRequest(NSURLRequest(URL: NSURL(string: self.detailUrl)!))
    
  }
  
}
