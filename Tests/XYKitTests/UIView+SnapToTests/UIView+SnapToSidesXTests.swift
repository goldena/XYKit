//
//  UIViewSnapToSidesXTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToSidesXTests: XCTestCase {
    
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
    
    func test_snapTo_sidesX_view() {
        sut = view1.sidesX(snapTo: view2)
        
        XCTAssertEqual(sut.count, 2)
        
        let leadingConstraint = view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor)
        leadingConstraint.isActive = true
                
        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))
        
        let trailingConstraint = view1.trailingAnchor.constraint(equalTo: view2.trailingAnchor)
        trailingConstraint.isActive = true
                        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: trailingConstraint))
    }
     
    func test_snapTo_sidesX_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.sidesX(snapTo: .safeArea)
        
        XCTAssertEqual(sut.count, 2)
        
        let leadingConstraint = view2.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor)
        leadingConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))
        
        let trailingConstraint = view2.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor)
        trailingConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: trailingConstraint))
    }
    
    func test_snapTo_sidesX_margins() {
        sut = view1.sidesX(snapTo: .margin)
        
        XCTAssertEqual(sut.count, 2)
        
        let leadingMargin = view1.directionalLayoutMargins.leading
        let leadingConstraint = view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: leadingMargin)
        leadingConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))
        
        let trailingMargin = view1.directionalLayoutMargins.trailing
        let trailingConstraint = view1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -trailingMargin)
        trailingConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: trailingConstraint))
    }

    func test_snapTo_sidesX_padding() {
        sut = view1.sidesX(snapTo: .padding(20))
        
        XCTAssertEqual(sut.count, 2)
        
        let leadingConstraint = view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20)
        leadingConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))
        
        let trailingConstraint = view1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
        trailingConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: trailingConstraint))
    }
    
}
