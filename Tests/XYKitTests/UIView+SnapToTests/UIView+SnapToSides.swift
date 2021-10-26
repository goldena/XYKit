//
//  UIViewSnapToSidesTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToSidesTests: XCTestCase {
    
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
    
    func test_snapTo_sides_view() {
        sut = view1.sides(snapTo: view2)
        
        XCTAssertEqual(sut.count, 4)
        
        let leadingConstraint = view1.leadingAnchor.constraint(equalTo: view2.leadingAnchor)
        leadingConstraint.isActive = true
                
        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))
        
        let topConstraint = view1.topAnchor.constraint(equalTo: view2.topAnchor)
        topConstraint.isActive = true
                
        XCTAssertTrue(sut[1].isTheSameConstraint(as: topConstraint))
        
        let trailingConstraint = view1.trailingAnchor.constraint(equalTo: view2.trailingAnchor)
        trailingConstraint.isActive = true
                        
        XCTAssertTrue(sut[2].isTheSameConstraint(as: trailingConstraint))
        
        let bottomConstraint = view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor)
        bottomConstraint.isActive = true
                        
        XCTAssertTrue(sut[3].isTheSameConstraint(as: bottomConstraint))
    }
     
    func test_snapTo_sides_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.sides(snapTo: .safeArea)
        
        XCTAssertEqual(sut.count, 4)
        
        let leadingConstraint = view2.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor)
        leadingConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))

        let topConstraint = view2.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor)
        topConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: topConstraint))
        
        let trailingConstraint = view2.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor)
        trailingConstraint.isActive = true

        XCTAssertTrue(sut[2].isTheSameConstraint(as: trailingConstraint))
        
        let bottomConstraint = view2.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        bottomConstraint.isActive = true

        XCTAssertTrue(sut[3].isTheSameConstraint(as: bottomConstraint))
    }
    
    func test_snapTo_sides_margins() {
        sut = view1.sides(snapTo: .margin)
        
        XCTAssertEqual(sut.count, 4)
        
        let leadingMargin = view1.directionalLayoutMargins.top
        let leadingConstraint = view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: leadingMargin)
        leadingConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))

        let topMargin = view1.directionalLayoutMargins.top
        let topConstraint = view1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: topMargin)
        topConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: topConstraint))
        
        let trailingMargin = view1.directionalLayoutMargins.trailing
        let trailingConstraint = view1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -trailingMargin)
        trailingConstraint.isActive = true

        XCTAssertTrue(sut[2].isTheSameConstraint(as: trailingConstraint))
        
        let bottomMargin = view1.directionalLayoutMargins.bottom
        let bottomConstraint = view1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -bottomMargin)
        bottomConstraint.isActive = true

        XCTAssertTrue(sut[3].isTheSameConstraint(as: bottomConstraint))
    }

    func test_snapTo_sides_padding() {
        sut = view1.sides(snapTo: .padding(20))
        
        XCTAssertEqual(sut.count, 4)

        let leadingConstraint = view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20)
        leadingConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: leadingConstraint))
        
        let topConstraint = view1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20)
        topConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: topConstraint))
        
        let trailingConstraint = view1.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
        trailingConstraint.isActive = true

        XCTAssertTrue(sut[2].isTheSameConstraint(as: trailingConstraint))
        
        let bottomConstraint = view1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        bottomConstraint.isActive = true

        XCTAssertTrue(sut[3].isTheSameConstraint(as: bottomConstraint))
    }
    
}
