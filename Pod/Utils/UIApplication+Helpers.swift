//
//  Dictionary+Helpers.swift
//
//  Created by Alex Zdorovets on 6/17/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation
import CoreLocation
import CoreTelephony.CTTelephonyNetworkInfo
import CoreTelephony.CTCarrier

extension UIApplication {
    
    //MARK: - Safari
    
    public class func openUrl(url:NSURL) {
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    //MARK: - Phone
    
    public static var canCall : Bool {
        get {
            return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode != nil
        }
    }
    
    public class func call(number:String) throws {
        let phoneURLString = "telprompt://" + number.stringByReplacingOccurrencesOfString("-", withString: "").stringByReplacingOccurrencesOfString(" ", withString: "")
        if UIApplication.canCall {
            if let phoneURL = NSURL(string: phoneURLString) {
                UIApplication.sharedApplication().openURL(phoneURL)
            } else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Not valid phone number", comment: "")]
                throw NSError(domain: "com.UIApplication.ext", code: 0, userInfo: userInfo)
            }
        } else {
            let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Your device doesn't support calls", comment: "")]
            throw NSError(domain: "com.UIApplication.ext", code: 0, userInfo: userInfo)
        }
    }
    
    //MARK: - GoogleMap
    
    @nonobjc static let GoogleMapKey = "comgooglemaps://"
    @nonobjc static let GoogleMapItunesLink = "https://itunes.apple.com/us/app/google-maps/id585027354?mt=8"
    
    public class func googleMapRoute(from:CLLocation, to:CLLocation) throws {
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: self.GoogleMapKey)!) {
            if CLLocationCoordinate2DIsValid(from.coordinate) {
                let urlString = String(format: "%@?saddr=%f,%f&daddr=%f,%f", self.GoogleMapKey, from.coordinate.latitude, from.coordinate.longitude, to.coordinate.latitude, to.coordinate.longitude)
                UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
            } else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("unableToFindLocation", comment: "")]
                throw NSError(domain: "com.UIApplication.ext", code: 0, userInfo: userInfo)
            }
        } else {
            throw self.getWantInstall()
        }
    }
    
    class func getWantInstall() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("installGoogleMapMessage", comment: ""), "url" : self.GoogleMapItunesLink]
        return NSError(domain: "com.UIApplication.ext", code: 1, userInfo: userInfo)
    }
}