//
//  NetworkingCLient.swift
//  JSOS_POST
//
//  Created by Nikhil Balne on 28/10/20.
//

import Foundation
import Alamofire

class NetworkingClient: NSObject {
        
    static let networkingClient = NetworkingClient()
    
    func excutePostServiceCall(url:String, controller:UIViewController, parameters:Parameters, completion: @escaping (_ result: DataResponse<Any>) -> Void) {
        
        print("URL:\(url)")
        print("Parameters:\(parameters)")
        
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        headers["HeaderKey"] = "HeaderKey"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers
            ).responseJSON{
                response in
                    completion(response)
            }
    }
}
