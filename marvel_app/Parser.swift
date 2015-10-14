
import Foundation

class Parser {
  
  func parseListOfCharactersFromJsonString(json: String) -> [Character] {
    let data = json.dataUsingEncoding(NSUTF8StringEncoding)
    let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
    let charactersArray = dictionary["data"] as! NSArray;
    var characters: [Character] = []
    for item in charactersArray {
      let name = item["name"] as! String
      let thumbnail = item["thumbnail"] as! NSDictionary
      let thumbnailPath = thumbnail["path"] as! String
      let thumbnailExtension = thumbnail["extension"] as! String
      let thumb = thumbnailPath + "." + thumbnailExtension
      let urls = item["urls"] as! NSArray
      let detail = urls[0]["url"] as! String
      characters.append(Character(name: name, thumb: thumb, detail: detail))
    }
    return characters
  }
  
}