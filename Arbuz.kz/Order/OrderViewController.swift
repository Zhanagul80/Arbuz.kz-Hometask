//
//  OrderViewController.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 29.05.2022.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var fullnameTextfield: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func didTapOrderButton(_ sender: UIButton) {
        // Taking values
        
        let fullname = fullnameTextfield.text ?? ""
        let address = addressTextField.text ?? ""
        let telephone = telephoneTextField.text ?? ""
        
        let date = datepicker.date
        
        let now = Date()
        
        let deliveryDate = Calendar.current.dateComponents([.day], from: date, to: now)
        let delivery = deliveryDate.day!
        
        let title = "My order"
        let message = "Successfully ordered! Your name: \(fullname), your address: \(address), your telephone number: \(telephone) and date of your order: \(delivery)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAlertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}
