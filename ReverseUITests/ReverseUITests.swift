//
//  ReverseUITests.swift
//  ReverseUITests
//
//  Created by Данік on 07/02/2023.
//

import XCTest


final class ReverseUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // reverse textfield tap and type
        let reverseTextField = app.textFields["Type Here"]
        XCTAssertTrue(reverseTextField.exists)
        reverseTextField.tap()
        reverseTextField.typeText("Hello Obama")
        reverseTextField.typeText("\n")
        
        
        
        // click the reverse button
        let reverseButton = app.buttons["Reverse"]
        XCTAssertTrue(reverseButton.exists)
        reverseButton.tap()
        
        // check if the text reversed
        let reversedLabel = app.staticTexts.element(matching: .any, identifier: "ReversedTextLabel")
        XCTAssertTrue(reversedLabel.label.contains("olleH amabO"))
        
        // click the Clear button
        let clearButton = app.buttons["Clear"]
        XCTAssertTrue(clearButton.exists)
        clearButton.tap()
        
        // Check if the textField is clear
        let clearTextField = app.textFields["Type Here"]
        XCTAssertTrue(clearTextField.label.isEmpty)
        
        // check if the reversedTextlabel isEmpty
        let clearLabel = app.staticTexts.element(matching: .any, identifier: "ReversedTextLabel")
        XCTAssertTrue(clearLabel.exists)
        XCTAssertTrue(clearLabel.label.isEmpty)
    }
    
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
}
