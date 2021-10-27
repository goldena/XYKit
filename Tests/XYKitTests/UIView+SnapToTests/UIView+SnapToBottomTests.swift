//
//  UIView+SnapToFirstBaselineTests.swift
//  
//  Created by Denis Goloborodko on 25.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToBottomTests: XCTestCase {
    
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
    
    func test_snapTo_bottom_anchor() {
        sut = view1.bottom(snapTo: view2.bottom)
        
        let constraint = view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_bottom_view() {
        sut = view1.bottom(snapTo: view2)
        
        let constraint = view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_bottom_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.bottom(snapTo: .safeArea)
        
        let constraint = view2.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_bottom_margin() {
        sut = view1.bottom(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.trailing
        let constraint = view1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_bottom_padding() {
        sut = view1.bottom(snapTo: .padding(20))
        
        let constraint = view1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}
