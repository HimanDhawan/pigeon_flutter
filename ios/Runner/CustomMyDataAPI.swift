//
//  CustomMyDataAPI.swift
//  Runner
//
//  Created by Himan Dhawan on 4/24/24.
//
import Flutter
import Foundation
import UIKit

public class CustomMyDataAPI: NSObject, MyDataApi {
    public func sendDataData(_ data: MyData, completion: @escaping (ResponseData?, FlutterError?) -> Void) {
        let responseData = ResponseData.init()
        responseData.name = data.name! + "from native"
        completion(responseData,nil)
    }
}
