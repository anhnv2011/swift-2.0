//
//  DetailViewController.swift
//  MasterDetailTemplateFromNothing
//
//  Created by anh  nguyen viet on 8/3/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var cellNameLabel: UILabel!
    var cellName:String?{
        didSet{
            configure()
        }
        
        //bat cu khi nao set se chay 1 ham, trong trường hợp này bất cứ khi nào cellname được set 1 giá trị thì nó sẽ hàm configure
    }
    
    // hàm update giao dien cho view controller
    func configure() -> Void
    {
        if let realCellName = cellName
        {
            if let nameLabel = cellNameLabel
            {
                nameLabel.text = realCellName
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }

}
