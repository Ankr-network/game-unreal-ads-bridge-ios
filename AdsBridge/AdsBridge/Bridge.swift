import Foundation
import ANKR_adlibrary
import UIKit

@objc open class Bridge : NSObject
{
    static var service = AdService()
    
    @objc static public func Initialize(appId : NSString, deviceId : NSString, publicAddress : NSString, language : NSString)
    {
        let stringAppId = String(appId)
        let stringDeviceId = String(deviceId)
        let stringPublicAddress = String(publicAddress)
        let stringLanguage = String(language)
        
        print("Unreal iOS - AnkrAds - StartSession - appId: " + stringAppId
              + " | deviceId: " + stringDeviceId
              + " | publicAddress: " + stringPublicAddress
              + " | language: " + stringLanguage)

        service.start(
            appId: stringAppId,
            deviceId: stringDeviceId,
            publicAddress: stringPublicAddress,
            language: stringLanguage)
        
        service.output = { (msg) -> Void in
            print("Unreal iOS - output");
            print(msg);
        };
    }
    
    @objc static public func LoadAd(unitId : NSString)
    {   
        let stringUnitId =  String(unitId)
        print("Unreal iOS - AnkrAds - LoadAd - unitId: " + stringUnitId)
        service.preloadAd(unitId: stringUnitId)
    }
    
    @objc static public func Show(unitId : NSString)
    {
        let stringUnitId =  String(unitId)
        print("Unreal iOS - AnkrAds - Show - unitId: " + stringUnitId)
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            print("Unreal Found topController " + topController.navigationController.debugDescription)
            service.show(for:topController.view, unitId: stringUnitId)
            return
        }
        
        print("Unreal topController not found")
    }
}
