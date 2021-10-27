//
//  NSLayoutConstraint+ExtensionsTests.swift
//
//  Created by Denis Goloborodko on 24.10.21.
//

import XCTest
@testable import XYKit

final class NSLayoutConstraintExtensionsTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: NSLayoutConstraint!
    
    private var mainView: UIView!
    private var view1: UIView!
    private var view2: UIView!
    
    // MARK: - SUT Lifecycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mainView = UIView()
        
        view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(view1)

        view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(view2)
        
        sut = view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor)
    }
    
    override func tearDownWithError() throws {
        sut = nil

        view1 = nil
        view2 = nil

        mainView = nil
        
        try super.tearDownWithError()
    }
    
    func test_constraint_is_activated_and_deactivated() {
        XCTAssertTrue(sut.activate().isActive)
        
        XCTAssertFalse(sut.deactivate().isActive)
    }
    
    func test_constraint_activation_deactivation_returns_the_same_self() {
        XCTAssertIdentical(sut, sut.activate())
        
        XCTAssertIdentical(sut, sut.deactivate())
    }
    
    func test_constraint_offset() {
        XCTAssertEqual(sut.constant, sut.offset(0).constant)

        XCTAssertEqual(sut.constant + 20, sut.offset(20).constant)
        
        // Return constant to zero
        sut.constant = 0
        
        XCTAssertEqual(sut.constant - 20, sut.offset(-20).constant)
    }
    
    func test_setting_offset_returns_the_same_self() {
        XCTAssertIdentical(sut, sut.offset(20))
    }
    
    func test_constraint_priority() {
        XCTAssertNotEqual(sut.priority, sut.priority(.defaultLow).priority)
    }
    
    func test_constraint_priority_returns_the_same_self() {
        XCTAssertIdentical(sut, sut.priority(.dragThatCannotResizeScene))
    }

    func test_constraint_id() {
        XCTAssertNil(sut.identifier)
        
        sut.id("test")
        
        guard let newId = sut.identifier else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(newId, "test")
    }
    
    func test_constraint_id_returns_the_same_self() {
        XCTAssertIdentical(sut, sut.id("test"))
    }

    
}
