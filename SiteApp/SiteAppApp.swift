//
//  SiteAppApp.swift
//  SiteApp
//
//  Created by Greg Bolsinga on 3/24/23.
//

import Site
import SwiftUI

struct Inner : View {
//  @State private var archiveNavigation = ArchiveNavigation()
  @SceneStorage("navigation.state") private var archiveNavigation = ArchiveNavigation()

  var body: some View {
    EmptyView()
  }
}

@main
struct SiteAppApp: App {
  @Environment(\.scenePhase) private var scenePhase

#if !os(macOS)
  @UIApplicationDelegateAdaptor(ArchiveAppDelegate.self) private var appDelegate
#endif

  @State private var model = SiteModel(urlString: "https://www.bolsinga.com/json/shows.json")

  @SceneStorage("navigation.state") private var archiveNavigation = ArchiveNavigation()

  var body: some Scene {
    WindowGroup {
      SiteView(model)
        .onAppear {
          appDelegate.thing = 3
          appDelegate.archiveNavigation = archiveNavigation
        }
    }
    .onChange(of: scenePhase) { _, newScenePhase in
      if newScenePhase == .active {
        appDelegate.thing = 3
      }
    }
    #if !os(tvOS)
      .commands {
        RefreshCommand { await model.load() }
      }
    #endif
  }
}
