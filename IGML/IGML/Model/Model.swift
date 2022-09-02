//
//  Model.swift
//  IGML
//
//  Created by Vivek Lakshmanan on 02/09/22.
//

import Foundation

protocol bookingDelegate {
    func didUpdatebooking(_ booking: TableBooking, bookingtab: Booking)
    func didFailWithError(error: Error)
    
}


struct TableBooking {
    
    var delegate: bookingDelegate?
    
    let baseURL = "https://igmiweb.com/gladdenhub/Api/search_table Method - POST"
    let apiKey = "NB10SKS20AS30"
    
    func booking() {
        
        let fullurl = "\(baseURL)/?apikey=\(apiKey)"
        
        if let url = URL(string: fullurl) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    delegate?.didUpdatebooking(self, bookingtab: Booking.init())
                    }
                }
            task.resume()
    }
    }
}
