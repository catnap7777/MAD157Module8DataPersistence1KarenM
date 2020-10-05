//
//  ViewController.swift
//  MAD157Module8DataPersistence1KarenM
//
//  Created by Karen Mathes on 10/5/20.
//  Copyright © 2020 TygerMatrix Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mySerialNumber: UITextField!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    
    @IBAction func mySaveButton(_ sender: Any) {
        
    //.. save data and states of objects in UserDefaults
    UserDefaults.standard.set(mySerialNumber.text, forKey: "Text")
    UserDefaults.standard.set(mySwitch.isOn, forKey: "Switch")
    UserDefaults.standard.set(mySlider.value, forKey: "Slider")
        
    //.. to print out the path of the UserDefaults plist
    //.. from StackOverflow :) https://stackoverflow.com/questions/1676938/easy-way-to-see-saved-nsuserdefaults#:~:text=You%20will%20see%20the%20contents%20in%20your%20Xcode%20editor.&text=Sorted%20by%20most%20recent%20date,file%20in%20the%20plist%20editor.&text=Go%20to%3A%20%2FUsers%2F%7BUser,%7D%2FLibrary%2FContainers%2Fcom.&text=This%20is%20the%20whole%20path,be%20in%20a%20plist%20file.
        
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
    let folder = path[0]
    NSLog("Your NSUserDefaults are stored in this folder: \(folder)/Preferences")
        
    print("****** \(UserDefaults.standard.dictionaryRepresentation())")
        
    }
    
    //.. load data and states of objects from UserDefaults
    @IBAction func myLoadButton(_ sender: Any) {
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "Switch")
        mySlider.value = UserDefaults.standard.float(forKey: "Slider")
        mySerialNumber.text = UserDefaults.standard.string(forKey: "Text")
       
    }
    
    @IBAction func myDeleteButton(_ sender: Any) {
        mySwitch.isOn = true
        mySlider.value = 0.5
        mySerialNumber.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
   }


}

