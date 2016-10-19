//
//  ViewController.swift
//  Math
//
//  Created by anh  nguyen viet on 7/20/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var soketquadung = 0
    var soketquasai = 0
    
    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    
    @IBOutlet weak var lbl_pheptinh: UILabel!
    
    @IBOutlet weak var lbl_right: UILabel!
    @IBOutlet weak var lbl_Wrong: UILabel!
    @IBOutlet weak var btn_b1: UIButton!
    @IBOutlet weak var btn_b2: UIButton!
    @IBOutlet weak var btn_b3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
    }
    
    
    
    @IBAction func btn_action(sender: UIButton) {
        let giatri1 = Int(btn_b1.currentTitle!)
        let giatri2 = Int(btn_b2.currentTitle!)
        let giatri3 = Int(btn_b3.currentTitle!)
        
        if(sender.tag == 101){
            if (lbl_pheptinh.text == "+")
            {
                let tonghaiso = sum(giatri2!, p2:giatri3!)
                let dapan = check(giatri1!, p2: tonghaiso)
                if (dapan == true)
                    {
                        print(soketquadung)
                        soketquadung += 1
                        lbl_right.text = String(soketquadung)
                    }
                else
                    {
                        print(soketquasai)
                        soketquasai = soketquasai + 1
                        lbl_Wrong.text = String(soketquasai)
                    }
                
            }
            
            else
            {
                let hieuhaiso = sub(giatri2!, p2:giatri3!)
                let hieuhaiso2 = sub(giatri3!, p2:giatri2!)
                let dapan = check(giatri1!, p2: hieuhaiso)
                let dapan2 = check(giatri1!, p2: hieuhaiso2)
                if (dapan == true || dapan2 == true)
                {
                    print(soketquadung)
                    soketquadung += 1
                    lbl_right.text = String(soketquadung)
                }
                else
                {
                    print(soketquasai)
                    soketquasai = soketquasai + 1
                    lbl_Wrong.text = String(soketquasai)
                }

            }
        }
        else if(sender.tag == 102){
            if (lbl_pheptinh.text == "+")
            {
                let tonghaiso = sum(giatri1!, p2:giatri3!)
                let dapan = check(giatri2!, p2: tonghaiso)
                if (dapan == true)
                {
                    print(soketquadung)
                    soketquadung += 1
                    lbl_right.text = String(soketquadung)
                }
                else
                {
                    print(soketquasai)
                    soketquasai = soketquasai + 1
                    lbl_Wrong.text = String(soketquasai)
                }
                
            }
                
            else
            {
                let hieuhaiso = sub(giatri1!, p2:giatri3!)
                let hieuhaiso2 = sub(giatri3!, p2:giatri1!)

                let dapan = check(giatri2!, p2: hieuhaiso)
                let dapan2 = check(giatri2!, p2: hieuhaiso2)

                if (dapan == true || dapan2 == true)
                {
                    print(soketquadung)
                    soketquadung += 1
                    lbl_right.text = String(soketquadung)
                }
                else
                {
                    print(soketquasai)
                    soketquasai = soketquasai + 1
                    lbl_Wrong.text = String(soketquasai)
                }
                
            }
        }
        else if(sender.tag == 103){
            if (lbl_pheptinh.text == "+")
            {
                let tonghaiso = sum(giatri1!, p2:giatri2!)
                let dapan = check(giatri3!, p2: tonghaiso)
                if (dapan == true)
                {
                    print(soketquadung)
                    soketquadung += 1
                    lbl_right.text = String(soketquadung)
                }
                else
                {
                    print(soketquasai)
                    soketquasai = soketquasai + 1
                    lbl_Wrong.text = String(soketquasai)
                }
                
            }
                
            else
            {
                let hieuhaiso = sub(giatri1!, p2:giatri2!)
                let hieuhaiso2 = sub(giatri2!, p2:giatri1!)

                let dapan = check(giatri3!, p2: hieuhaiso)
                let dapan2 = check(giatri3!, p2: hieuhaiso2)

                if (dapan == true || dapan2 == true)
                {
                    print(soketquadung)
                    soketquadung += 1
                    lbl_right.text = String(soketquadung)
                }
                else
                {
                    print(soketquasai)
                    soketquasai = soketquasai + 1
                    lbl_Wrong.text = String(soketquasai)
                }
                
            }

            
        }
        setRandom()
        
    }
    
     
    
    
    func setRandom()
    {
        
//        let random1 = Int(arc4random_uniform(4)) + 1
//        let random2 = Int(arc4random_uniform(4)) + 1
//        print ("\(random1) \(random2)")
        
        
       
        var so1 = Int(arc4random_uniform(4)) + 1
        var so2 = Int(arc4random_uniform(4)) + 1
        var ketqua = sum(so1, p2: so2)
        var ketqua2 = sub(so1, p2:so2)
        //print("ket qua la: \(ketqua)")
        
        // loai bo dap an trung cua phep cong
        while (so1 == so2 || so2 == ketqua || so1 == ketqua)
        //while (so1 != so2 && so2 != ketqua && so1 != ketqua)
        {
            so1 = Int(arc4random_uniform(4)) + 1
            so2 = Int(arc4random_uniform(4)) + 1
        }
        ketqua = sum(so1, p2:so2)

      //  print("\(so1)  \(so2)  \(ketqua)")
        setResult(so1, randomB: so2, Ketqua: ketqua)
        
        
        
        
         //loai bo dan an trung cua phep tru
        while (so1 == so2 || so2 == ketqua2 || so1 == ketqua2) {
            so1 = Int(arc4random_uniform(4)) + 1
            so2 = Int(arc4random_uniform(4)) + 1
            ketqua2 = sub(so1, p2:so2)
        }
        //print("\(so1)  \(so2)  \(ketqua2)")
        setResult2(so1, randomB: so2, Ketqua2: ketqua2)
        
        
        
        
        let randomPheptinh = Int(arc4random_uniform(2)) + 1
        if (randomPheptinh == 1)
        {
            lbl_pheptinh.text = "+"
            setResult(so1, randomB:so2, Ketqua: ketqua)
        }
        if (randomPheptinh == 2)
        {
            lbl_pheptinh.text = "-"
            setResult2(so1, randomB:so2, Ketqua2: ketqua2)
            //setResult2(random1, randomB:random2, Ketqua2: ketqua2)
            
        }
        lbl_p1.text = String(so1)
        lbl_p2.text = String(so2)
        
        
        
        
    }
    
    
    
    //hien thi ket qua phep cong
    func setResult( randomA: Int, randomB:Int, Ketqua:Int)
    {
        let randomVitri = Int(arc4random_uniform(3)) + 1
        //print(randomVitri)
        
        if (randomVitri == 3)
        {
            
            btn_b1.setTitle(String(randomA), forState: .Normal)
            print(btn_b1.currentTitle )
            btn_b2.setTitle(String(randomB), forState: .Normal)
            btn_b3.setTitle(String(self.sum(randomA, p2:randomB)), forState: .Normal)
        }
            
        else if(randomVitri == 2)
        {
            
            self.btn_b1.setTitle(String(randomA), forState: .Normal)
            self.btn_b3.setTitle(String(randomB), forState: .Normal)
            self.btn_b2.setTitle(String(self.sum(randomA, p2:randomB)), forState: .Normal)
        }
            
        else
        {
            
            self.btn_b2.setTitle(String(randomA), forState: .Normal)
            self.btn_b3.setTitle(String(randomB), forState: .Normal)
            self.btn_b1.setTitle(String(self.sum(randomA, p2:randomB)), forState: .Normal)
        }
    }
    
    //hien thi ket qua phep tru
    func setResult2( randomA: Int, randomB:Int, Ketqua2:Int)
    {
        let randomVitri = Int(arc4random_uniform(3)) + 1
        //print(randomVitri)
//        print("vi tri: ")
//        print(randomVitri)
        if (randomVitri == 3)
        {
            
            btn_b1.setTitle(String(randomA), forState: .Normal)
            btn_b2.setTitle(String(randomB), forState: .Normal)
            btn_b3.setTitle(String(sub(randomA, p2:randomB)), forState: .Normal)
        }
            
        else if(randomVitri == 2)
        {
            
            self.btn_b1.setTitle(String(randomA), forState: .Normal)
            self.btn_b3.setTitle(String(randomB), forState: .Normal)
            self.btn_b2.setTitle(String(self.sub(randomA, p2:randomB)), forState: .Normal)
        }
            
        else
        {
            
            self.btn_b2.setTitle(String(randomA), forState: .Normal)
            self.btn_b3.setTitle(String(randomB), forState: .Normal)
            self.btn_b1.setTitle(String(self.sub(randomA, p2:randomB)), forState: .Normal)
        }
    }
    
    //Tinh tong
    func sum(p1: Int, p2: Int) -> Int
    {
        return p1 + p2
        
    }
    
    //phep tru
    func sub(p1: Int, p2: Int) -> Int
    {
        return p1 - p2
        
    }
    
    //kiem tra bang nhau
    func check(p1: Int, p2: Int) -> Bool {
        var dapan = false
        if(p1 == p2)
        {
            dapan = true
        }
        return dapan
    }
    
    
    
}

