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
  @StateObject private var model = VaultModel(
    url: URL(string: "https://www.bolsinga.com/json/shows.json")!)

  var body: some Scene {
    WindowGroup {
      VaultView(model)
    }.commands {
      RefreshCommand(model: model)
    }
  }
}
