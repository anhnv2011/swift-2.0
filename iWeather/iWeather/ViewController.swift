//
//  ViewController.swift
//  iWeather
//
//  Created by anh  nguyen viet on 7/21/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_quote: UILabel!
    @IBOutlet weak var lbl_temp: UILabel!
    @IBOutlet weak var backgroundimageView: UIImageView!
    
    
    var quotes = ["Cuộc sống những người tốt là tuổi thanh xuân vĩnh viễn.","Thước đo cuộc đời không phải ở chỗ nó dài hay nó ngắn, mà ở chỗ bạn đã sử dụng nó như thế nào.", "Sứ mệnh chân chính của con người là sống, chứ không phải tồn tại."]
        
    var city = ["Ha noi","Hai phon","Namdinh"]
    
    var backgroundImage = ["Blood","Moon","Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func randomButton(sender: AnyObject) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_city.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbl_quote.text = quotes[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        backgroundimageView.image = UIImage.init(named: backgroundImage[imageIndex])
        getTemp();
        
    }
    
    func getTemp() -> Void {
        let randomNumber = String(format: "%2.1f", tempRandom())
        lbl_temp.text = randomNumber
    }
    
    func tempRandom() -> Double
    {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
}

