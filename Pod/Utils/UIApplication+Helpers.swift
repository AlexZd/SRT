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
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    public class var appVersion : String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    public class var appBuildNumber : String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    public class var bundleIdentifier : String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    //MARK: - Safari
    
    @discardableResult public class func openUrl(url:URL?) -> Bool {
        guard let link = url, UIApplication.shared.canOpenURL(link) else { return false }
        return UIApplication.shared.openURL(link)
    }
    
    //MARK: - iTunes
    
    public class func openAppItunes(id:String) {
        let url = URL(string:"https://itunes.apple.com/app/id" + id)
        UIApplication.openUrl(url: url)
    }
    
    public class func openAppForReview(id:String) {
        let url = URL(string:"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?pageNumber=0&sortOrdering=1&type=Purple+Software&mt=8&id=" + id)
        UIApplication.openUrl(url: url)
    }
    
    //MARK: - Phone
    
    public static var canCall : Bool {
        get {
            return CTTelephonyNetworkInfo().subscriberCellularProvider?.isoCountryCode != nil
        }
    }
    
    public class func call(number:String) throws {
        let phoneURLString = "telprompt://" + number.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: " ", with: "")
        if UIApplication.canCall {
            if let phoneURL = URL(string: phoneURLString) {
                UIApplication.shared.openURL(phoneURL)
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
    @nonobjc static let GoogleMapItunesId = "585027354"
    
    public class func googleMapRoute(from:CLLocation, to:CLLocation) throws {
        if UIApplication.shared.canOpenURL(URL(string: self.GoogleMapKey)!) {
            if CLLocationCoordinate2DIsValid(from.coordinate) {
                let urlString = String(format: "%@?saddr=%f,%f&daddr=%f,%f", self.GoogleMapKey, from.coordinate.latitude, from.coordinate.longitude, to.coordinate.latitude, to.coordinate.longitude)
                UIApplication.shared.openURL(URL(string: urlString)!)
            } else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("unableToFindLocation", comment: "")]
                throw NSError(domain: "com.UIApplication.ext", code: 0, userInfo: userInfo)
            }
        } else {
            throw self.getWantInstall()
        }
    }
    
    class func getWantInstall() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("installGoogleMapMessage", comment: ""), "appId" : self.GoogleMapItunesId]
        return NSError(domain: "com.UIApplication.ext", code: 1, userInfo: userInfo)
    }
}
