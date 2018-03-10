//
//  ViewController.swift
//  Xylophone
//
//  Created by Seo JaeHyeong on 2018. 2. 22..
//  Copyright © 2018년 Seo Jaehyeong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    let soundArray = ["Do", "Re", "Mi", "Pa", "Sol", "Ra", "Si"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func padPressed(_ sender: UIButton) {
        playSound(soundFileName: soundArray[sender.tag - 1])
    }
    
    
    func playSound(soundFileName: String) {
        let soundUrl = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        } catch {
            print(error)
        }
        audioPlayer?.play()
    }
    
    
    
}

