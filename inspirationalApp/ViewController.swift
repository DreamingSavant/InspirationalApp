//
//  ViewController.swift
//  inspirationalApp
//
//  Created by Roderick Presswod on 3/5/18.
//  Copyright © 2018 Roderick Presswod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageShownHere: UIImageView!
    

    let inspirationalImages = ["8ac4118f2a188309540df07fd90c24a7--kungfu-martial-art","623a4fbfa8ce432b8b0308018b09736c","13398486_1755187451433017_1204460684_n","be2476055e01e2e57b6b37305167124f","Bring-A-Design-Together-With-Color-Washes","C5I0jgDWAAALzZu","C5Iq4vYWAAI8Cxu","CfY-kLcUIAExKR9"]
    // randomImageNumber is used to call arc4random_uniform()
    var randomImageNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateImagesInView()
        addSwipeGestureRecognizers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // imageShownHere needs to contain var inspirationalImages
    func updateImagesInView() {
        //when callins arc4random, be sure to add 1 extra number..why?
        randomImageNumber = Int(arc4random_uniform(8))
        imageShownHere.image = UIImage(named: inspirationalImages[randomImageNumber])
    }
    
    
    
// import swipe left/right function to cycle through photos
    // photos assigned in random order

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?){
        updateImagesInView()
    }
    
    
    
    @IBAction func nextImage(_ sender: UIButton) {
        updateImagesInView()
    }
    
    
    
    // UISwipeGestureRecognizer
    
    func addSwipeGestureRecognizers(){
        let gestureDirections: [UISwipeGestureRecognizerDirection] = [.up, .right, .down, .left]
        for gestureDirection in gestureDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gestureRecognizer.direction = gestureDirection
            self.view?.addGestureRecognizer(gestureRecognizer)
            
            
        }
    }
    
    @objc func handleSwipe(gesture: UIGestureRecognizer){
        if let gesture = gesture as? UISwipeGestureRecognizer{
            switch gesture.direction {
            case .up:
                print("Swiped up")
            case .right:
                print("Swiped right")
                    updateImagesInView()
            case .down:
                    print("Swiped down")
            case .left:
                print("Swiped left")
                updateImagesInView()
            default:
                print("No direction swiped")
            }
        }
    }
    

}

