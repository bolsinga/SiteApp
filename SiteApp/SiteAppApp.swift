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
  @State private var model = VaultModel(urlString: "https://www.bolsinga.com/json/shows.json")

  var body: some Scene {
    WindowGroup {
      VaultView(model)
    }.commands {
      RefreshCommand(model: model)
    }
  }
}
