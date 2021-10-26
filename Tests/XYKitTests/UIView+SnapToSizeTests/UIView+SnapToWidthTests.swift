//
//  UIViewSnapToWidth.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToWidthTests: XCTestCase {
    
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
    
    // MARK: - SnapTo absolute width
    
    func test_snapTo_absolute_width() {
        sut = view1.width(100)
        
        let constraint = view1.widthAnchor.constraint(equalToConstant: 100)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_absolute_width_or_less() {
        sut = view1.width(100, or: .less)
        
        let constraint = view1.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_absolute_width_or_more() {
        sut = view1.width(100, or: .more)
        
        let constraint = view1.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    // MARK: - SnapTo width anchor
    
    func test_snapTo_width_anchor() {
        sut = view1.width(snapTo: view2.width)
        
        let constraint = view1.widthAnchor.constraint(equalTo: view2.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_anchor_or_less() {
        sut = view1.width(snapTo: view2.width, or: .less)
        
        let constraint = view1.widthAnchor.constraint(lessThanOrEqualTo: view2.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_anchor_or_more() {
        sut = view1.width(snapTo: view2.width, or: .more)
        
        let constraint = view1.widthAnchor.constraint(greaterThanOrEqualTo: view2.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_anchor_with_multiplier() {
        sut = view1.width(snapTo: view2.width, ratio: 1/2)
        
        let constraint = view1.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_anchor_or_less_with_multiplier() {
        sut = view1.width(snapTo: view2.width, or: .less, ratio: 1/2)
        
        let constraint = view1.widthAnchor.constraint(lessThanOrEqualTo: view2.widthAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_anchor_or_more_with_multiplier() {
        sut = view1.width(snapTo: view2.width, or: .more, ratio: 1/2)
        
        let constraint = view1.widthAnchor.constraint(greaterThanOrEqualTo: view2.widthAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    // MARK: - SnapTo view's width
    
    func test_snapTo_width_view() {
        sut = view1.width(snapTo: view2)
        
        let constraint = view1.widthAnchor.constraint(equalTo: view2.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_view_or_less() {
        sut = view1.width(snapTo: view2, or: .less)
        
        let constraint = view1.widthAnchor.constraint(lessThanOrEqualTo: view2.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_view_or_more() {
        sut = view1.width(snapTo: view2, or: .more)
        
        let constraint = view1.widthAnchor.constraint(greaterThanOrEqualTo: view2.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_view_with_multiplier() {
        sut = view1.width(snapTo: view2, ratio: 1/2)
        
        let constraint = view1.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_view_or_less_with_multiplier() {
        sut = view1.width(snapTo: view2, or: .less, ratio: 1/2)
        
        let constraint = view1.widthAnchor.constraint(lessThanOrEqualTo: view2.widthAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_view_or_more_with_multiplier() {
        sut = view1.width(snapTo: view2, or: .more, ratio: 1/2)
        
        let constraint = view1.widthAnchor.constraint(greaterThanOrEqualTo: view2.widthAnchor, multiplier: 1/2)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    // MARK: - SnapTo width limits
    
    func test_snapTo_width_safeArea() {
        view2.addSubview(view1)
        
        sut = view2.width(snapTo: .safeArea)
        
        let constraint = view2.widthAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.widthAnchor)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_margins() {
        view2.addSubview(view1)
        
        sut = view2.width(snapTo: .margin)
        
        let margin = view2.directionalLayoutMargins.leading + view2.directionalLayoutMargins.trailing
        
        let constraint = view2.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -margin)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_width_padding() {
        view2.addSubview(view1)
        
        sut = view2.width(snapTo: .padding(20))
                
        let constraint = view2.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -40)
        constraint.isActive = true
        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}
