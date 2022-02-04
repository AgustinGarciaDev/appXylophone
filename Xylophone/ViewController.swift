//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonRed(_ sender: UIButton) {
        
        guard let textBtn = sender.titleLabel?.text else {return}
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1.0
        }
        soundPlayer(textBtn)
    }
    
    func soundPlayer(_ keyName:String){
        guard let url = Bundle.main.url(forResource: keyName, withExtension: "wav") else { return }

        do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                guard let player = player else { return }

                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
    }
    
    

}

