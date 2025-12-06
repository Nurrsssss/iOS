//
//  Superhero_Randomizer_App__via_Packages_UITestsLaunchTests.swift
//  Superhero Randomizer App (via Packages)UITests
//
//  Created by Nursultan Tolegen on 06.12.2025.
//

import XCTest

final class Superhero_Randomizer_App__via_Packages_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
