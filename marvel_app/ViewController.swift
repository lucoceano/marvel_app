
import UIKit
import Haneke

class ViewController: UITableViewController {

  var characters: [Character] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let parser = Parser()
    
    MarvelAPI.getCharactersFromCloud { (results: String) -> Void in
        self.characters = parser.parseListOfCharactersFromJsonString(results)
        self.tableView.reloadData()
    }

  }
  

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CharacterCell
    
    let character = characters[indexPath.row]
    
    cell.characterName.text = character.name
    cell.characterThumb.image = nil
    cell.characterThumb.hnk_setImageFromURL(NSURL(string: character.thumb)!)
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    let character = characters[indexPath.row]
    
    let detailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("detail") as! DetailViewController
    detailViewController.detailUrl = character.detail
    self.navigationController?.showViewController(detailViewController, sender: self)
    
  }
  
}

