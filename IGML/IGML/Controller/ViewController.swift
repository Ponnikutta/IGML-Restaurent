//
//  ViewController.swift
//  IGML
//
//  Created by Vivek Lakshmanan on 02/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var booking = TableBooking()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        booking.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

// MARK: - Booking Delegate

extension ViewController: bookingDelegate {
    func didUpdatebooking(_ booking: TableBooking, bookingtab: Booking) {
        print ("Booking Confirmed")
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
