//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 6/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // getting the managed object context from shared persistent container
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError("No app deleagate ")
        }
        let context = appDelegate.persistentContainer.viewContext
          
        
        // storing the default data
        var thingsListData: [ThingsList] = [ThingsList]()
        
        // fetching the Things List
        let requestData = NSFetchRequest<ThingsList>(entityName: "ThingsList")
               
        do {
            thingsListData = try context.fetch(requestData)
            // counting the thingsListData and if none is present, then add the following data
            if thingsListData.count == 0 {
                //adding in a new ground/item
                NSEntityDescription.insertNewObject(forEntityName: "ThingsList", into: context)
                
                thingsListData = try context.fetch(requestData)

                
                //Melbournce Cricket Ground
                var data = Things(context: context)
                data.thingslist = thingsListData.first
                
                data.thingslist?.boundTitle = "Favourite Grounds"
                       
                data.url = "https://www.abc.net.au/news/image/5175326-3x2-940x627.jpg"
                data.name = "MCG"
                data.sportsType = "Cricket Stadium"
                data.title_field1 = "Capacity"
                data.capacity = "100024"
                data.title_field2 = "Opened"
                data.opened = "1853"
                data.title_field3 = "Owner"
                data.owner = "Melbourne Cricket Club"
                data.notes = "Best in the world"
                data.boundLoaction = "Brunton Ave, Richmond VIC"
                data.boundLatitude = "-37.8231702"
                data.boundLongitude = "144.989093"
                
               
                       
                //Bribsane Cricket Ground
                data = Things(context: context)
                data.thingslist = thingsListData.first
                data.url = "https://assets.atdw-online.com.au/images/58eb0e41d72e0aa26d1b765a8447629f.jpeg?rect=127%2c0%2c2053%2c1540&w=1200"
                data.name = "Gabba"
                data.sportsType = "Cricket Stadium"
                data.title_field1 = "Capacity"
                data.capacity = "42000"
                data.title_field2 = "Opened"
                data.opened = "1895"
                data.title_field3 = "Owner"
                data.owner = "Stadiums"
                data.notes = "Brisbane's best stadium"
                data.boundLoaction = "Vulture street, Woolongabba, Brisbane"
                data.boundLatitude = "-27.4845041"
                data.boundLongitude = "153.0323669"
                       
                //Sydney CricketGround
                data = Things(context: context)
                data.thingslist = thingsListData.first
                data.url = "https://www.austadiums.com/stadiums/photos/Sydney-Cricket-Ground.jpg"
                data.name = "SCG"
                data.sportsType = "Cricket Stadium"
                data.title_field1 = "Capacity"
                data.capacity = "48601"
                data.title_field2 = "Opened"
                data.opened = "1848"
                data.title_field3 = "Owner"
                data.owner = "Sydney Cricket Ground Trust"
                data.notes = " "
                data.boundLoaction = "Moore Park, Sydney"
                data.boundLatitude = "-33.9009291"
                data.boundLongitude = "151.2152663"
                
                
                // saving the data
                try? context.save()
            }
        }
        catch {
            print("There is an error in the default data")
        }
               
        
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environment(\.managedObjectContext, context)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // saves changings in the applications managed object context when the app is closed
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError("No app deleagate ")
        }
        let context = appDelegate.persistentContainer.viewContext
        if context.hasChanges {
            _ = try? context.save()
        }
    }
}

