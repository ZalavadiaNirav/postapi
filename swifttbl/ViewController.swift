//
//  ViewController.swift
//  swifttbl
//
//  Created by Nirav Zalavadia on 27/11/17.
//  Copyright © 2017 CNSoftNetIndiaPvtLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiCalled()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func apiCalled()
    {
        let apiUrl:NSURL=NSURL(string:"http://172.30.6.65/RealtyDaddyMobile/api/search/shortlistedproject")!
        var req:URLRequest=URLRequest.init(url: apiUrl as URL, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 0)
        req.httpMethod="post"
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
    req.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiJhZGUxZDA4NC0zYTRjLWU3MTEtODBjYS0wMDE1NWQwNjYyMDMiLCJuYW1laWQiOiJhcmp1bi51cHNAZ21haWwuY29tIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0LyIsImV4cCI6MTUwODkwNzI3NywibmJmIjoxNTA2MzE1Mjc3fQ.ldksmZZQNX_FE18uKgQD-aaVHCDvt2XtJtVLAqGad6U", forHTTPHeaderField:"UserToken")
        
        let parameters=["start":1,"next":10,"city":1,"sort":1] as [String : Any]
        do
        {
            req.httpBody=try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.sortedKeys) as Data
        }
        catch
        {
            print("error in parameter conversion")
        }

        
        let task=URLSession.shared.dataTask(with: req) { (data, response, error) in
        do
        {
            if(error==nil)
            {
                print("error \(String(describing: error))")
            }
            if (error==nil)
            {
                let resultData=try JSONSerialization.jsonObject(with:data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                print("result \(String(describing: resultData["Data"]))")
               
            }
        }
        catch
        {
            
        }
        }
        task.resume()
    }
}

