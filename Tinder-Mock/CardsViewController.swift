//
//  CardsViewController.swift
//  Tinder-Mock
//
//  Created by Aditya Dhingra on 4/6/17.
//  Copyright © 2017 Aditya Dhingra. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    var isGone: Bool!
    let maxAngleInDegree:CGFloat = 30
    var firstTouchPoint: CGPoint?
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
            print("Gesture began")
            cardInitialCenter = cardImageView.center
            firstTouchPoint = location
        
        } else if sender.state == .changed {
            
            print("Gesture is changing")
            print(translation)
            print("\n")
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
//            //Rotaions
//            if translation.x > 0 {
//                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(20 * Double.pi / 180))
//            }
//            else {
//                cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(-20 * Double.pi / 180))
//            }
//            
//            if translation.x > 50 {
//                cardImageView.transform = cardImageView.transform.translatedBy(x: 150, y: 0)
//                isGone = true
//            } else {
//                cardImageView.transform = cardImageView.transform.translatedBy(x: -150, y: 0)
//                isGone = true
//            }
            
            var transformInDegree = maxAngleInDegree * (translation.x / (cardImageView.frame.size.width/2))
            
            if firstTouchPoint!.y > cardInitialCenter.y {
                transformInDegree = -1 * transformInDegree
            }
            
            cardImageView.transform = view.transform.rotated(by: CGFloat(transformInDegree * CGFloat(Double.pi) / 180))

            
//            cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(45 * Double.pi / 180))
            
        } else if sender.state == .ended {
            
            print("Gesture ended")
                UIView.animate(withDuration: 0.4, animations: {
                    self.cardImageView.center = self.cardInitialCenter
                    self.cardImageView.transform = CGAffineTransform.identity
                })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let profileVC = segue.destination as! ProfileViewController
        profileVC.userImg = cardImageView.image
        profileVC.test = "It works!"
    }

}
