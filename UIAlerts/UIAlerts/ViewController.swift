//
//  ViewController.swift
//  UIAlerts
//
//  Created by CTS on 28/06/20.
//  Copyright © 2020 CTS. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "network")
    var firstName: UITextField!
    var lastName: UITextField!
    var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Different print statements
        print("inside viewDidLoad");
        debugPrint("Hello World!");
        dump("💩");
    }

    @IBAction func oneButtonAlertClick(_ sender: Any) {
        let message = "ViewController";
        NSLog( "inside oneButtonAlertClick: '%@'", message );
        
        // create the alert
        let alert = UIAlertController(title: "Welcome 😃", message: "Cheers! 🍻", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            os_log("ok clicked", type: .info)
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func twoButtonAlertClick(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Log off", message: "Are you sure to log out?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { action in
            self.logoff()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func threeButtonAlertClick(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Update", message: "What would you like to do?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: { action in
            self.update()
        }))
        alert.addAction(UIAlertAction(title: "Remind Me Tomorrow", style: UIAlertAction.Style.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func userInputButtonAlert(_ sender: Any) {
        
        displayForm(message: "Please enter guest information")
    }
    
    
    
    @IBAction func customButtonAlertClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Status", message: "Whats on your mind?", preferredStyle: .alert)
        alert.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned alert] _ in
            let status = alert.textFields![0]
            os_log("status: %@", type: .info, status)
        }
        
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
    
    func logoff(){
        os_log("logging off...")
        
        os_log("user logged off successfully", type: .info)
    }
    
    func update() {
        os_log("inside update")
        os_log("contacting url = %@", log: log, "www.example.com")
        
    }
    
    func displayForm(message:String){
        //create alert
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        //create cancel button
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel)
        
        //create save button
        let saveAction = UIAlertAction(title: "Submit", style: .default) { (action) -> Void in
            //validation logic goes here
            if((self.firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)!
                || (self.lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)!
                || (self.email.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! ){
                //if this code is run, that mean at least of the fields doesn't have value
                self.firstName.text = ""
                self.lastName.text = ""
                self.email.text = ""
                
                self.displayForm(message: "One of the values entered was invalid. Please enter guest information")
            }
            os_log("username: %@", self.lastName.text!)
            print("This entry was added for guest name: \(String(describing: self.firstName.text)) \(String(describing: self.lastName.text)), email : \(String(describing: self.email.text))")
        }
        
        //add button to alert
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        //create first name textfield
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type first name here..."
            self.firstName = textField
        })
        
        //create last name textfield
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type last name here..."
            self.lastName = textField
        })
        
        //create email field
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Type email here..."
            self.email = textField
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}

