//
//  UIView+CenterTests.swift
//  
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToCenterTests: XCTestCase {
    
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
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        view1 = nil
        view2 = nil
        
        mainView = nil
        
        try super.tearDownWithError()
    }
    
    func test_snapTo_centerX() {
        sut = view1.centerX()
        
        let constraint = view1.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_centerX_view() {
        sut = view1.centerX(snapTo: view2)
        
        let constraint = view1.centerXAnchor.constraint(equalTo: view2.centerXAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_centerX_anchor() {
        sut = view1.centerX(snapTo: view2.centerX)
        
        let constraint = view1.centerXAnchor.constraint(equalTo: view2.centerXAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_centerY() {
        sut = view1.centerY()
        
        let constraint = view1.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_centerY_view() {
        sut = view1.centerY(snapTo: view2)
        
        let constraint = view1.centerYAnchor.constraint(equalTo: view2.centerYAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_centerY_anchor() {
        sut = view1.centerY(snapTo: view2.centerY)
        
        let constraint = view1.centerYAnchor.constraint(equalTo: view2.centerYAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}
