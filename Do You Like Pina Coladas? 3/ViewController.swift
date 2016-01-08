//
//  ViewController.swift
//  Do You Like Pina Coladas? 3
//
//  Created by TSoto1 on 12/20/15.
//  Copyright (c) 2015 TSoto1. All rights reserved.
//

import UIKit
import AVFoundation
//holds code that allows use of speakers

class ViewController: UIViewController
{
    
    var audioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("escapeSong", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()
    // audioURL links the audio called "escpaeSong.m4a" from the "Audio" folder created under "Supporting Files"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        try! audioPlayer = AVAudioPlayer(contentsOfURL: audioURL)
        audioPlayer.play()
        //plays the audio
    }


}

