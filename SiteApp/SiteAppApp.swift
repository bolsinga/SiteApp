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
  @State var vault: Vault? = nil
  @State var error: Error? = nil

  var body: some Scene {
    WindowGroup {
      Group {
        if let vault {
          ArchiveCategoryList(vault: vault)
        } else if let error {
          Text(error.localizedDescription)
        } else {
          ProgressView()
        }
      }.task {
        guard let url = URL(string: "https://www.bolsinga.com/json/shows.json") else {
          fatalError("need this url")
        }

        do {
          vault = try await Vault.load(url: url)
        } catch {
          self.error = error
        }
      }
    }
  }
}
