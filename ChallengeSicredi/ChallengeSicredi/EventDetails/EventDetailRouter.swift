//
//  EventDetailsRouter.swift
//  ChallengeSicredi
//
//  Created by Josias Fabrício on 14/12/21.
//

import Foundation
import UIKit

protocol EventDetailRoutingLogic {
    func routeToEventCheckin(eventId: String)
    func routeToShareEvent(items: [String])
}

class EventDetailRouter: EventDetailRoutingLogic {
    
    weak var viewController: EventDetailViewController?
    var dataStore: EventDetailDataStore?
    
    func routeToEventCheckin(eventId: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextViewController = storyboard.instantiateViewController(withIdentifier: "EventCheckinViewController")
            as? EventCheckinViewController {
            nextViewController.presenter?.dataStore?.eventId = eventId
            
            if let sheet = nextViewController.sheetPresentationController {
                sheet.detents = [ .medium() ]
            }
            
            viewController?.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    func routeToShareEvent(items: [String]) {
        let action = UIActivityViewController(activityItems: items, applicationActivities: nil)
        viewController?.present(action, animated: true)
    }
    
}
