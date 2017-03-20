//
//  CLPlacemark+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 3/14/17.
//
//

import MapKit
import Contacts

extension CLPlacemark {
    public var fullAddress: String {
        if let addressDic = self.addressDictionary, let lines = addressDic["FormattedAddressLines"] as? [String] {
            return lines.joined(separator: ", ")
        } else if #available(iOS 9.0, *) {
            let postalAddress = CNMutablePostalAddress()
            postalAddress.street = self.thoroughfare ?? ""
            postalAddress.city = self.locality ?? ""
            postalAddress.state = self.administrativeArea ?? ""
            postalAddress.postalCode = self.postalCode ?? ""
            postalAddress.country = self.country ?? ""
            postalAddress.isoCountryCode = self.isoCountryCode ?? ""
            
            return CNPostalAddressFormatter.string(from: postalAddress, style: .mailingAddress)
        } else {
            return "Address not available"
        }
    }
}
