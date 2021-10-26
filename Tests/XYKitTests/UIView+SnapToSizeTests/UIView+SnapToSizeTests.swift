//
//  UIView+SnapToSizeTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToSizeTests: XCTestCase {
    
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
    
    // MARK: - SnapTo absolute size
    
    func test_snapTo_absolute_size() {
        sut = view1.size(width: 100, height: 200)
        
        XCTAssertEqual(sut.count, 2)
        
        let constraintWidth = view1.widthAnchor.constraint(equalToConstant: 100)
        constraintWidth.isActive = true
        
        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(equalToConstant: 200)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_absolute_size_or_less() {
        sut = view1.size(width: 100, height: 200, or: .less)

        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        constraintWidth.isActive = true
        
        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_absolute_size_or_more() {
        sut = view1.size(width: 100, height: 200, or: .more)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        constraintWidth.isActive = true
        
        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }

    // MARK: - SnapTo size of a view

    func test_snapTo_view_size() {
        sut = view1.size(snapTo: view2)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(equalTo: view2.widthAnchor)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(equalTo: view2.heightAnchor)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_view_size_or_less() {
        sut = view1.size(snapTo: view2, or: .less)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(lessThanOrEqualTo: view2.widthAnchor)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(lessThanOrEqualTo: view2.heightAnchor)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_view_size_or_more() {
        sut = view1.size(snapTo: view2, or: .more)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(greaterThanOrEqualTo: view2.widthAnchor)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(greaterThanOrEqualTo: view2.heightAnchor)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_view_size_with_multiplier() {
        sut = view1.size(snapTo: view2, ratio: 1/2)

        XCTAssertEqual(sut.count, 2)
        
        let constraintWidth = view1.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 1/2)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(equalTo: view2.heightAnchor, multiplier: 1/2)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_view_size_or_less_with_multiplier() {
        sut = view1.size(snapTo: view2, or: .less, ratio: 1/2)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(lessThanOrEqualTo: view2.widthAnchor, multiplier: 1/2)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(lessThanOrEqualTo: view2.heightAnchor, multiplier: 1/2)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_snapTo_view_size_or_more_with_multiplier() {
        sut = view1.size(snapTo: view2, or: .more, ratio: 1/2)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(greaterThanOrEqualTo: view2.widthAnchor, multiplier: 1/2)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(greaterThanOrEqualTo: view2.heightAnchor, multiplier: 1/2)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }

    // MARK: - SnapTo size to limits

    func test_size_snapTo_safeArea() {
        sut = view1.size(snapTo: .safeArea)
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.widthAnchor)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.heightAnchor)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }

    func test_size_snapTo_margin() {
        sut = view1.size(snapTo: .margin)
        
        XCTAssertEqual(sut.count, 2)

        let marginsX = view1.directionalLayoutMargins.leading + view1.directionalLayoutMargins.trailing
        let constraintWidth = view1.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -marginsX)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let marginsY = view1.directionalLayoutMargins.top + view1.directionalLayoutMargins.bottom
        
        let constraintHeight = view1.heightAnchor.constraint(equalTo: mainView.heightAnchor, constant: -marginsY)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
    func test_size_snapTo_padding() {
        sut = view1.size(snapTo: .padding(20))
        
        XCTAssertEqual(sut.count, 2)

        let constraintWidth = view1.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -40)
        constraintWidth.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: constraintWidth))
        
        let constraintHeight = view1.heightAnchor.constraint(equalTo: mainView.heightAnchor, constant: -40)
        constraintHeight.isActive = true
        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: constraintHeight))
    }
    
}
