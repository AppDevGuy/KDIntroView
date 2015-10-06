//
//  ViewController.swift
//  IntroViewDemo
//
//  Created by Kedan Li on 15/7/5.
//  Copyright (c) 2015年 TakeFive Interactive. All rights reserved.
//

import UIKit
import KDIntroView

class ViewController: KDIntroViewController {
    
    @IBOutlet var beginButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginButtonView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 200)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        //setup the introduction view   : number of pages : the nib name of each page
        setup(["1View","2View","3View","4View","5View"])
        
        view.bringSubviewToFront(beginButtonView)
    }

    override func moveEverythingAccordingToIndex(index: CGFloat) {
        // setting the movement of the color of the background
        if index <= view.frame.width * 0.75{
            view.backgroundColor = UIColor.whiteColor()
        }else if index > view.frame.width * 0.75 && index <= view.frame.width * 1.25{
            view.backgroundColor = UIColor(red: 46.0/255, green: 176.0/255, blue: 138.0/255, alpha: 1)
        }else if index > view.frame.width * 1.25 && index < view.frame.width * 1.75{
            
            changeBackgroundColor(index, fromColor: UIColor(red: 46.0/255, green: 176.0/255, blue: 138.0/255, alpha: 1), toColor: UIColor(red: 143.0/255, green: 205.0/255, blue: 232.0/255, alpha: 1), fromIndex: view.frame.width * 1.25, toIndex: view.frame.width * 1.75)

        }else if index > view.frame.width * 1.75 && index <= view.frame.width * 3.65{
                view.backgroundColor = UIColor(red: 143.0/255, green: 205.0/255, blue: 232.0/255, alpha: 1)
        }else if index > view.frame.width * 3.65{
            view.backgroundColor = UIColor.whiteColor()
        }
        
        if index >= view.frame.width * 3.75 && index <= view.frame.width * 4{
            
            print(index - view.frame.width * 3.75)
            
            beginButtonView.transform = CGAffineTransformMake((index - view.frame.width * 3.75) * 2 / 150, 0, 0, (index - view.frame.width * 3.75) * 2 / 150, 0, 160 - (index - view.frame.width * 3.75) * 2)
        }else{
            beginButtonView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 160)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}