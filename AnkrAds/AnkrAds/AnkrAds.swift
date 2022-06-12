//
//  AnkrAds.swift
//  AnkrAds
//
//  Created by Ektishaf Ahwaz on 13/06/2022.
//

import ANKR_adlibrary
import SwiftUI

@objc open class AnkrAds : NSObject {
    var service : AdService

    @objc public override init()
    {
        service = AdServiceImp()
        super.init()
        
        print("AnkrAds - Initialized")
    }
    
    @objc public func StartSession(appId : String, deviceId : String, publicAddress : String, language : String)
    {
        print("AnkrAds - StartSession - appId: " + appId + " | deviceId: " + deviceId + " | publicAddress: " + publicAddress + " | language: " + language)
        
        service.start(startModel: StartModel(appId: appId, deviceId: deviceId, publicAddress: publicAddress, language: language))
    }
    
    @objc public func LoadAd(unitId : String)
    {
        print("AnkrAds - LoadAd - unitId: " + unitId)
        service.preloadAd(unitId: unitId)
    }
    
    @objc public func Show(view : UIView, unitId : String)
    {
        print("AnkrAds - Show - unitId: " + unitId)
        
        service.show(for: view, unitId: unitId)
    }
}
