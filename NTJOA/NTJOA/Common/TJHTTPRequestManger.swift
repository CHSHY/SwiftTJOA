//
//  TJHTTPRequestManger.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/20.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit


enum RequestType:Int {
    case GET = 1
    case POST = 2
}

class TJHTTPRequestManger: NSObject {
    
    class func sharedInstance() -> TJHTTPRequestManger {
        struct Static {
            static let instance = TJHTTPRequestManger()
        }
        return Static.instance
    }
    
    private override init() {}
    
    func Request(methodType : RequestType,
                 urlString : String, parameters : NSMutableDictionary,
                 success:@escaping (_ data:AnyObject)->(),
                 failure:@escaping (_ error: Error)->()){
        
        //AFNetWorking发送POST请求
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer.timeoutInterval = 5.0
        //接受的MIME格式
        manager.responseSerializer = AFJSONResponseSerializer()
        
        // 发送网络请求
        
        let baseUrl = MAIN_URL+urlString
        if methodType == .GET {
            manager.get(baseUrl,
                        parameters: parameters,
                        progress: nil,
                        success: { (task : URLSessionDataTask, data:Any) in
                            
                            let result = data as AnyObject
                            let statusCode = result["c"] as!NSInteger
                            print(statusCode)
                            if result["c"] as!NSInteger != 1{
                                return;
                            }
                            else{
                                
                              let dataArray = result["r"]
                               success(dataArray as AnyObject)
                            }
                            
            }, failure: { (task : URLSessionDataTask?, error:Error) in
                failure(error)
            })
            
      }else {
            
            
      }

    }
    
    func request(methodType : RequestType,urlString : String, parameters : NSMutableDictionary, finished:@escaping (_ result : AnyObject?, _ error : Error?) -> ()) {
        
        
        // 定义成功的回调闭包:使用一个常量来接收它
        let successCallBack = { (task : URLSessionDataTask, result : Any?) in
            finished(result as AnyObject?, nil)
        }
        // 定义一个失败的回调闭包:使用一个常量来接收它
        let failureCallBack = { (task : URLSessionDataTask?, error : Error) in
            finished(nil, error)
        }
        
        //AFNetWorking发送POST请求
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer.timeoutInterval = 5.0
        //接受的MIME格式
        manager.responseSerializer = AFJSONResponseSerializer()

        // 发送网络请求
       
        let baseUrl = MAIN_URL+urlString
        if methodType == .GET {
            manager.get(baseUrl, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }else {
            manager.post(baseUrl, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
        
    }
    
}
