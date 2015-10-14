import Alamofire

class MarvelAPI {
  
  class func getCharacters() -> String {
    return "{\"data\":[{\"id\":1009351,\"name\":\"Hulk\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0\",\"extension\":\"jpg\"},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/25/hulk?utm_campaign=apiRef&utm_source=33a225eb932d5133f77f6213da2ed101\"}]},{\"id\":1009368,\"name\":\"Iron Man\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55\",\"extension\":\"jpg\"},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/29/iron_man?utm_campaign=apiRef&utm_source=33a225eb932d5133f77f6213da2ed101\"}]},{\"id\":1009220,\"name\":\"Captain America\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087\",\"extension\":\"jpg\"},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/8/captain_america?utm_campaign=apiRef&utm_source=33a225eb932d5133f77f6213da2ed101\"}]},{\"id\":1009664,\"name\":\"Thor\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/d/d0/5269657a74350\",\"extension\":\"jpg\"},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/60/thor?utm_campaign=apiRef&utm_source=33a225eb932d5133f77f6213da2ed101\"}]}]}"
  }
  
  class func getCharactersFromCloud(result:(String)->Void) {
    Alamofire.request(.GET, "http://arcane-shelf-6616.herokuapp.com/")
      .responseString { response in

        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
            result(JSON)
        }
    }
  }
  
}