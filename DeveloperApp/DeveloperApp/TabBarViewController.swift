//
//  ViewController.swift
//  DeveloperApp
//
//  Created by 황석현 on 9/19/25.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let discoverTab = UINavigationController(rootViewController: DiscoverTabViewController())
        let browseTab = UINavigationController(rootViewController: BrowseTabViewController())
        let wwdcTab = UINavigationController(rootViewController: WWDCTabViewController())
        let accountTab = UINavigationController(rootViewController: AccountTabViewController())
        let searchTab = UINavigationController(rootViewController: SearchTabViewController())
        
        discoverTab.title = "Discover"
        browseTab.title = "Browse"
        wwdcTab.title = "WWDC"
        accountTab.title = "Account"
        searchTab.title = "Search"
        
        discoverTab.tabBarItem.image = UIImage(systemName: "star.fill")
        browseTab.tabBarItem.image = UIImage(systemName: "rectangle.stack.fill")
        wwdcTab.tabBarItem.image = UIImage(systemName: "apple.logo")
        accountTab.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        searchTab.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        setViewControllers([discoverTab, browseTab, wwdcTab, accountTab, searchTab], animated: true)
        
        self.selectedIndex = 2 // wwdc
    }


}

#Preview {
    TabBarViewController()
}
