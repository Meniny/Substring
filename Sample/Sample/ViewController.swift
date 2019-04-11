//
//  ViewController.swift
//  Sample
//
//  Created by Meniny on 2018-05-17.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import Substring

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let string = "A_Example_String"
        
        print(string)
        
        print(string.substring(at: 1).string as Any, string[1].string as Any) // _
        print(string.substring(to: 4).string as Any, string[...4].string as Any) // A_Exa
        print(string.substring(from: 2).string as Any, string[2...].string as Any) // Example_String
        print(string.substring(before: 5).string as Any, string[..<5].string as Any) // A_Exa
        print(string.substring(in: 2...5).string as Any, string[2...5].string as Any) // Exam
        print(string.substring(in: 2..<5).string as Any, string[2..<5].string as Any) // Exa
        
        /*
         A_Example_String
         Optional("_") Optional("_")
         Optional("A_Exa") Optional("A_Exa")
         Optional("Example_String") Optional("Example_String")
         Optional("A_Exa") Optional("A_Exa")
         Optional("Exam") Optional("Exam")
         Optional("Exa") Optional("Exa")
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

