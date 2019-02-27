// Week 6 - Day 1 - Facade Pattern

import Foundation

enum Eternal {
    
    static func set(_ object: Any, forKey defaultName: String) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(object, forKey:defaultName)
        defaults.synchronize()
    }
    
    static func object(forKey key: String) -> AnyObject! {
        let defaults: UserDefaults = UserDefaults.standard
        return defaults.object(forKey: key) as AnyObject
    }
    
}

Eternal.set("Disconnect me. I’d rather be nothing", forKey:"Bishop")
Eternal.object(forKey: "Bishop")


/////////////////////////////////////////////////////////////////////////////
//Other Example

class Navigation{
    static func getMeDirectionsHome(){
        print("Getting directions home")
    }
}

class UberEats{
    static func orderIndianFood(){
        print("Ordering Indian Food")
    }
}

class Messaging{
    static func textMyWifeImHeadingHome(){
        print("Texting your wife I'm heading home")
    }
}

class SiriShortCutFacade{
    
    static func siriImHeadingHome(){
        Navigation.getMeDirectionsHome()
        UberEats.orderIndianFood()
        Messaging.textMyWifeImHeadingHome()
    }
    
}
