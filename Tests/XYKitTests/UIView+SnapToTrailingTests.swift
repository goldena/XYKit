//
//  UIView+SnapToTrailingTests.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToTrailingTests: XCTestCase {
    
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
    
    func test_snapTo_trailing_anchor() {
        sut = view1.trailing(snapTo: view2.trailing)
        
        let constraint = view1.trailingAnchor.constraint(equalTo: view2.trailingAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_trailing_view() {
        sut = view1.trailing(snapTo: view2)
        
        let constraint = view1.trailingAnchor.constraint(equalTo: view2.trailingAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_trailing_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.trailing(snapTo: .safeArea)
        
        let constraint = view2.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_trailing_margin() {
        sut = view1.trailing(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.trailing
        let constraint = view1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_trailing_padding() {
        sut = view1.trailing(snapTo: .padding(20))
        
        let constraint = view1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}

