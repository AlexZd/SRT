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
    
    //MARK: - App Details
    
    public class var appName : String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
    }
    
    public class var appVersion : String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    public class var appBuildNumber : String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as! String
    }
    
    public class var bundleIdentifier : String {
        return NSBundle.mainBundle().bundleIdentifier ?? ""
    }
    
    //MARK: - Safari
    
    public class func openUrl(url:NSURL?) {
        if let link = url where UIApplication.sharedApplication().canOpenURL(link) {
            UIApplication.sharedApplication().openURL(link)
        }
    }
    
    //MARK: - iTunes
    
    public class func openAppItunes(id:String) {
        let url = NSURL(string:"https://itunes.apple.com/app/id" + id)
        UIApplication.openUrl(url)
    }
    
    public class func openAppForReview(id:String) {
        let url = NSURL(string:"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?pageNumber=0&sortOrdering=1&type=Purple+Software&mt=8&id=" + id)
        UIApplication.openUrl(url)
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