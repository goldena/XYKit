//
//  NSLayoutConstraint+ArrayExtensionsTests.swift
//  
//  Created by Denis Goloborodko on 24.10.21.
//

import XCTest
@testable import XYKit

final class NSLayoutConstraintArrayExtensionsTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: [NSLayoutConstraint]!
    
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
        
        sut = [
            view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: view2.trailingAnchor)
        ]
    }
    
    override func tearDownWithError() throws {
        view1 = nil
        view2 = nil

        mainView = nil

        sut = nil
        
        try super.tearDownWithError()
    }
    
    func test_constraints_are_activated_and_deactivated() {
        sut.activate()
        
        for constraint in sut {
            XCTAssertTrue(constraint.isActive)
        }
        
        sut.deactivate()
        
        for constraint in sut {
            XCTAssertFalse(constraint.isActive)
        }
    }

    func test_same_constraints_returned_after_activation_deactivation() {
        XCTAssertIdentical(sut[0], sut.activate()[0])
        
        XCTAssertIdentical(sut[1], sut.deactivate()[1])
    }
    
}
