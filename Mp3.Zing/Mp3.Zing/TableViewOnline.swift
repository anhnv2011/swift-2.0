//
//  TableViewOnline.swift
//  Mp3.Zing
//
//  Created by anh  nguyen viet on 9/14/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class TableViewOnline: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listSongs = [Song]()
    
    @IBOutlet weak var myOnlineTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.myOnlineTable.delegate = self
        self.myOnlineTable.dataSource = self
    }

    func getData()
    {
        let data = NSData(contentsOf: NSURL(string: "http://mp3.zing.vn/bang-xep-hang/bai-hat-Au-My/IWZ9Z0BW.html") as! URL)
        //print(String(data: data as! Data, encoding: String.Encoding.utf8))
        let doc = TFHpple(htmlData: data as Data!)
        if let elements = doc?.search(withXPathQuery: "//h3[@class='title-item']/a") as? [TFHppleElement]
        {
            
            //http://api.mp3.zing.vn/api/mobile/song/getsonginfo?keycode=fafd463e2131914934b73310aa34a23f&requestdata={"id":"ZW67FWWF"}
            
            
            for element in elements
            {
                //print(element.content)
                
//                DispatchQueue.global().async {
//                    // Background thread
//                    DispatchQueue.main.async(execute: {
//                        // UI Updates
//                    })
//                }
                
                
                let id = self.getID(path: element.object(forKey: "href") as NSString)
                
                let url = NSURL(string: "http:api.mp3.zing.vn/api/mobile/song/getsonginfo?keycode=fafd463e2131914934b73310aa34a23f&requestdata={\"id\":\"\(id)\"}".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
             
                var stringData =  ""
            
                do
                {
                    stringData = try String (contentsOf: url! as URL)
                }
                catch let error as NSError
                {
                    print(error)
                }
                print(stringData)
                let json = self.convertStringToDictionary(string: stringData)
//                print(json)
                
                if (json != nil)
                {
                    self.addSongToList(json: json!)
                }
            }
            for song in listSongs
            {
            print(song.title)
            }
            myOnlineTable.reloadData()
        }
    }
    
    
    func addSongToList(json: [String: AnyObject])
    {
        let title = json["title"] as! String
        let artistName = json["artist"] as! String
        let thumbnail = json["thumbnail"] as! String
        let source = json["source"]!["128"] as! String
        
        let currentSong = Song(title: title, artistName: artistName, thumbnail: thumbnail, source: source)
        listSongs.append(currentSong)
    }
    func convertStringToDictionary(string: String) -> [String: AnyObject]?
    {
        if let data = string.data(using: String.Encoding.utf8)
        {
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
                return json!
            }
            
                
            catch
            {
                print("sai gi day")
            }
            
        }
        return nil
        
    }
    
    func getID(path: NSString) -> String
    {
        let id = (path.lastPathComponent as NSString).deletingPathExtension
        //print(path)
        return id
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //#MARK : table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSongs.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.imageView?.image = listSongs[indexPath.row].thumbnail
        cell.textLabel?.text = listSongs[indexPath.row].title
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
}
