//
//  UIView+SnapToLeadingTests.swift
//  
//  Created by Denis Goloborodko on 24.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToLeadingTests: XCTestCase {
    
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
    
    func test_snapTo_leading_anchor() {
        sut = view1.leading(snapTo: view2.leading)
        
        let constraint = view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_leading_view() {
        sut = view1.leading(snapTo: view2)
        
        let constraint = view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_leading_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.leading(snapTo: .safeArea)
        
        let constraint = view2.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_leading_margin() {
        sut = view1.leading(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.leading
        let constraint = view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_leading_padding() {
        sut = view1.leading(snapTo: .padding(20))
        
        let constraint = view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}

