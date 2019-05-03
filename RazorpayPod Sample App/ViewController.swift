//
//  ViewController.swift
//  RazorpayPod Sample App
//
//  Created by Harsha Marri on 21/03/19.
//  Copyright © 2019 Harsha Marri. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController , RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
      
        let alert = UIAlertController(title: "Failure!", message: "Your payment is failed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        let alert = UIAlertController(title: "Success!", message: "Payment is \(payment_id)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)

    }
    
    
    private var razorpay: Razorpay!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        razorpay = Razorpay.initWithKey("rzp_test_IFMmoKlMshyTeL", andDelegate: self)
        
    }
    
    private func openCheckout() {
        let options: [String: Any] = [
            "amount" : "10000",
            "description": "Stranger Things",
            "image": "https://venturebeat.com/wp-content/uploads/2016/06/netflix-logo.png?w=1200&strip=all",
            "name": "Netflix",
            "currency" : "INR",
            "prefill": [
             "contact": "7019284852",
             "email": "harsha.marri@razorpay.com"
             ],
            "notes": [
                "key1":"45678.0000"
            ],
            "external" : [
                "wallets" : [ "jiomoney" ]
            ],

            "theme": ["color": "#000000"]
        ]
        razorpay.open(options, displayController: self)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        openCheckout()
        }
    
}

