//
//  UIViewSnapToHeightTests.swift
//  
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToHeightTests: XCTestCase {
    
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
    
    // MARK: - SnapTo absolute height
    
    func test_snapTo_absolute_height() {
        sut = view1.height(100)
        
        let constraint = view1.heightAnchor.constraint(equalToConstant: 100)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_absolute_height_or_less() {
        sut = view1.height(100, or: .less)
        
        let constraint = view1.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_absolute_height_or_more() {
        sut = view1.height(100, or: .more)
        
        let constraint = view1.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    // MARK: - SnapTo height anchor
    
    func test_snapTo_height_anchor() {
        sut = view1.height(snapTo: view2.height)
        
        let constraint = view1.heightAnchor.constraint(equalTo: view2.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_anchor_or_less() {
        sut = view1.height(snapTo: view2.height, or: .less)
        
        let constraint = view1.heightAnchor.constraint(lessThanOrEqualTo: view2.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_anchor_or_more() {
        sut = view1.height(snapTo: view2.height, or: .more)
        
        let constraint = view1.heightAnchor.constraint(greaterThanOrEqualTo: view2.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_anchor_with_multiplier() {
        sut = view1.height(snapTo: view2.height, ratio: 1/2)
        
        let constraint = view1.heightAnchor.constraint(equalTo: view2.heightAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_anchor_or_less_with_multiplier() {
        sut = view1.height(snapTo: view2.height, or: .less, ratio: 1/2)
        
        let constraint = view1.heightAnchor.constraint(lessThanOrEqualTo: view2.heightAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_anchor_or_more_with_multiplier() {
        sut = view1.height(snapTo: view2.height, or: .more, ratio: 1/2)
        
        let constraint = view1.heightAnchor.constraint(greaterThanOrEqualTo: view2.heightAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    // MARK: - SnapTo view's height
    
    func test_snapTo_height_view() {
        sut = view1.height(snapTo: view2)
        
        let constraint = view1.heightAnchor.constraint(equalTo: view2.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_view_or_less() {
        sut = view1.height(snapTo: view2, or: .less)
        
        let constraint = view1.heightAnchor.constraint(lessThanOrEqualTo: view2.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_view_or_more() {
        sut = view1.height(snapTo: view2, or: .more)
        
        let constraint = view1.heightAnchor.constraint(greaterThanOrEqualTo: view2.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_view_with_multiplier() {
        sut = view1.height(snapTo: view2, ratio: 1/2)
        
        let constraint = view1.heightAnchor.constraint(equalTo: view2.heightAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_view_or_less_with_multiplier() {
        sut = view1.height(snapTo: view2, or: .less, ratio: 1/2)
        
        let constraint = view1.heightAnchor.constraint(lessThanOrEqualTo: view2.heightAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_view_or_more_with_multiplier() {
        sut = view1.height(snapTo: view2, or: .more, ratio: 1/2)
        
        let constraint = view1.heightAnchor.constraint(greaterThanOrEqualTo: view2.heightAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    // MARK: - SnapTo width limits
    
    func test_snapTo_height_safeArea() {
        view2.addSubview(view1)
        
        sut = view2.height(snapTo: .safeArea)
        
        let constraint = view2.heightAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.heightAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_margins() {
        view2.addSubview(view1)
        
        sut = view2.height(snapTo: .margin)
        
        let margin = view2.directionalLayoutMargins.top + view2.directionalLayoutMargins.bottom
        
        let constraint = view2.heightAnchor.constraint(equalTo: mainView.heightAnchor, constant: -margin)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_height_padding() {
        view2.addSubview(view1)
        
        sut = view2.height(snapTo: .padding(20))
                
        let constraint = view2.heightAnchor.constraint(equalTo: mainView.heightAnchor, constant: -40)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}
