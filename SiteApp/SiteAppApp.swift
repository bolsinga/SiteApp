//
//  SiteAppApp.swift
//  SiteApp
//
//  Created by Greg Bolsinga on 3/24/23.
//

import Site
import SwiftUI

@main
struct SiteAppApp: App {
  var body: some Scene {
    WindowGroup {
      VaultView(url: URL(string: "https://www.bolsinga.com/json/shows.json")!)
    }
  }
}
