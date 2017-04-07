//
//  ProfileViewController.swift
//  Tinder-Mock
//
//  Created by Aditya Dhingra on 4/6/17.
//  Copyright © 2017 Aditya Dhingra. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userImg: UIImage!
    var test: String!

    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(test)
        // Do any additional setup after loading the view.
        ProfileImage.image = userImg
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
