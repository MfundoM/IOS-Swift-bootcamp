//
//  ViewController.swift
//  D07
//
//  Created by Mfundo MTHETHWA on 2018/10/10.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit
import ForecastIO
import RecastAI

class ViewController: UIViewController {
    
    var bot : RecastAIClient?
    let client = DarkSkyClient(apiKey: "e98ffae0dc99d72910ac06c71c5423a3")
    
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        guard let myString = inputText.text, !myString.isEmpty else {
            print("String is empty.")
            responseLabel.text = "Please enter a valid location!"
            return
        }
        makeRequest(request : inputText.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bot = RecastAIClient(token : "e951711fac06c44b93a7eb96e2ca17e6", language: "en")
        self.client.language = .english
        self.client.units = .si
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Make text request to Recast.AI API
     */
    func makeRequest(request: String)
    {
        // Call makeRequest with string parameter to make a text request
        self.bot?.textRequest(request, successHandler: recastRequestDone, failureHandle: processError)
    }
    
    /**
     Method called when the request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(_ response : Response)
    {
        print(response)
        if let location = response.get(entity: "location")
        {
//        print(location!)
            callForecast(lat: location["lat"] as! Double, lng: location["lng"] as! Double)
        }
        else {
            DispatchQueue.main.async {
                self.responseLabel.text = "Request not found"
            }
        }
    }
    
    func callForecast(lat: Double, lng: Double){
        print("callForecast")
//        client.units = .si
        
        client.getForecast(latitude: lat, longitude: lng) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let currentForecast, let requestMetadata):
                    //  We got the current forecast!
                    print("currentForecast: \(currentForecast)")
                    print("requestMetadata: \(requestMetadata)")
                    self.responseLabel.text = currentForecast.currently?.summary
                case .failure(let error):
                    //  Uh-oh. We have an error!
                    print("Error : \(error)")
                    self.responseLabel.text = "Error"
                }
            }
        }
    }
//
    func processError(_ err: Error) {
//        print("processError : \(err)")
        DispatchQueue.main.async {
            print("processError : \(err.localizedDescription)")
            self.responseLabel.text = "Error"
        }
    }
}

