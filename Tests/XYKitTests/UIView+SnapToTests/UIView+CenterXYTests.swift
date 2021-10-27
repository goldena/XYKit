//
//  UIView+CenterXYTests.swift
//  
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToCenterXYTests: XCTestCase {
    
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
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        view1 = nil
        view2 = nil
        
        mainView = nil
        
        try super.tearDownWithError()
    }
    
    func test_snapTo_centerXY_in_superview() {
        sut = view1.centerXY()
    
        XCTAssertEqual(sut.count, 2)
        
        let constraintX = view1.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        constraintX.isActive = true
        
        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintX))
        
        let constraintY = view1.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        constraintY.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintY))
    }
    
    func test_snapTo_centerXY_with_view() {
        sut = view1.centerXY(snapTo: view2)
    
        XCTAssertEqual(sut.count, 2)
        
        let constraintX = view1.centerXAnchor.constraint(equalTo: view2.centerXAnchor)
        constraintX.isActive = true
        
        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintX))
        
        let constraintY = view1.centerYAnchor.constraint(equalTo: view2.centerYAnchor)
        constraintY.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintY))
    }
    
}
