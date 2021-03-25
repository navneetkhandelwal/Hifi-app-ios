//
//  PaymentsViewController.swift
//  app
//
//  Created by Hrithik Nigam on 04/12/20.
//  Copyright © 2020 KZ. All rights reserved.
//

import UIKit
import Razorpay


class PaymentsViewController: UIViewController, RazorpayPaymentCompletionProtocol {
   
  var razorpay: RazorpayCheckout!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Pay"
        
        tabBarItem.image = #imageLiteral(resourceName: "pay")
      
        razorpay = RazorpayCheckout.initWithKey("rzp_test_eDh48c3xHaixUQ", andDelegate: self)
    }
    
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Contact: UITextField!
    @IBOutlet weak var Namer: UITextField!
    @IBOutlet weak var Amount: UITextField!
    
 
    
    func showpaymentform()
    {
        if(Email.text=="")
        {
            Email.text = "hifiteam@gmail.com"
        }
        let options: [String:Any] = [
            "amount": Amount.text! + "00", // 100 paise = 1 rupee
            "description": "How to use Razorpay Payment Gatway",
            "image": "https://www.supinehub.com/img/SupineHubLogo.gif",
            "name" : Namer.text!,
            "prefill": [
                "contact" : Contact.text!,
                "email" : Email.text!            ],
            "theme": [
                "color" : "#fdc5e7"
            ]
        ]
        razorpay.open(options)
    }

    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Failure", message: str, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        self.view.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
         let alert = UIAlertController(title: "Success", message: payment_id, preferredStyle: .alert)
         let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
         alert.addAction(action)
         self.view.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }


    
    @IBAction func paymentcheckout(_ sender: UIButton) {
        print("hello")
        self.showpaymentform()
    }
}
    
