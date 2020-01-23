//
//  ViewControllerFactory.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import UIKit

final class ViewControllerFactory: ViewControllerFactoryType {
    struct Constants {
        static let welcomeVCIdentifier = "WelcomeVC"
    }
    
    func getWelcomeViewController() -> WelcomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let welcomeVC = storyboard.instantiateViewController(withIdentifier: Constants.welcomeVCIdentifier) as! WelcomeViewController
        let interactor = GetIngredientsInteractor(
            ingredientsRepository: getIngredientsRepository())
        welcomeVC.getIngredientsInteractor = interactor
        return welcomeVC
    }
    
    func getIngredientsRepository() -> IngredientsRepositoryType {
        return IngredientsRepository(apiClient: APIClient())
    }
}
