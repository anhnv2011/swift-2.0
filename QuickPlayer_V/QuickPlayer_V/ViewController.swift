//
//  ViewController.swift
//  QuickPlayer_V
//
//  Created by anh  nguyen viet on 7/26/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var btn_Play: UIButton!
    @IBOutlet weak var sld_Volume: UISlider!
    @IBOutlet weak var lbl_CurrentTime: UILabel!
    @IBOutlet weak var lbl_TimeTotal: UILabel!
    @IBOutlet weak var sld_TimeDuration: UISlider!
    @IBOutlet weak var switch_Repeat: UISwitch!
    
    var audio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        audio.prepareToPlay()
        addThumbImgForSlider()
        
        audio.delegate = self
        
        audio.currentTime = 59
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateTimeLeft), userInfo: nil, repeats: true)
    }

    
    //setup
    func updateTimeLeft ()
        
    {
        let currentTime = Int(self.audio.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - (minutes * 60)
        
        
        
        
        // update time within label
        self.lbl_CurrentTime.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        
//        self.lbl_CurrentTime.text = String(format: "%2.2f", audio.currentTime/60) //vi no hien thi ra giay nen chia 60 doi ra phut
        self.lbl_TimeTotal.text = String(format: "%2.2f", audio.duration/60)
        self.sld_TimeDuration.value = Float(audio.currentTime/audio.duration)
        
    }
    
    func addThumbImgForSlider()
    {
        sld_Volume.setThumbImage(UIImage(named: "thumb.png"), forState: .Normal)
        sld_Volume.setThumbImage(UIImage(named: "thumbHightLight.png"), forState: .Highlighted)

    }

    
    var batnhac = 1
    @IBAction func action_Play(sender: AnyObject) {
        if (batnhac == 1)
        {
        audio.play()
        btn_Play.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
        batnhac = 0
        }
        else
        {
        audio.pause()
        btn_Play.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
        batnhac = 1
        }
    }

    
    @IBAction func sld_Volume(sender: UISlider) {
        
        print(sender.value)

        audio.volume = sender.value
        
    }
    
    @IBAction func sld_Duration(sender: UISlider) {
        print(sender.value)
        audio.currentTime = NSTimeInterval(sender.value)*audio.duration
        
        
        //sld_TimeDuration.value = sender.value
    }
    
    
    
    @IBAction func sld_Repeat(sender: UISwitch) {
    }


    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if switch_Repeat.on
        {
            print("Repeat")
            audio.play()
        }
        
        else
        {
        
            print("end")
            btn_Play.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
            
        }
    }

}

