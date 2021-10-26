//
//  UIViewSnapToSidesYTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToSidesYTests: XCTestCase {
    
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
    
    func test_snapTo_sidesY_view() {
        sut = view1.sidesY(snapTo: view2)
        
        XCTAssertEqual(sut.count, 2)
        
        let topConstraint = view1.topAnchor.constraint(equalTo: view2.topAnchor)
        topConstraint.isActive = true
                
        XCTAssertTrue(sut[0].isTheSameConstraint(as: topConstraint))
        
        let bottomConstraint = view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor)
        bottomConstraint.isActive = true
                        
        XCTAssertTrue(sut[1].isTheSameConstraint(as: bottomConstraint))
    }
     
    func test_snapTo_sidesY_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.sidesY(snapTo: .safeArea)
        
        XCTAssertEqual(sut.count, 2)
        
        let topConstraint = view2.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor)
        topConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: topConstraint))
        
        let bottomConstraint = view2.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        bottomConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: bottomConstraint))
    }
    
    func test_snapTo_sidesY_margins() {
        sut = view1.sidesY(snapTo: .margin)
        
        XCTAssertEqual(sut.count, 2)
        
        let topMargin = view1.directionalLayoutMargins.top
        let topConstraint = view1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: topMargin)
        topConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: topConstraint))
        
        let bottomMargin = view1.directionalLayoutMargins.bottom
        let bottomConstraint = view1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -bottomMargin)
        bottomConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: bottomConstraint))
    }

    func test_snapTo_sidesY_padding() {
        sut = view1.sidesY(snapTo: .padding(20))
        
        XCTAssertEqual(sut.count, 2)
        
        let topConstraint = view1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20)
        topConstraint.isActive = true

        XCTAssertTrue(sut[0].isTheSameConstraint(as: topConstraint))
        
        let bottomConstraint = view1.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        bottomConstraint.isActive = true

        XCTAssertTrue(sut[1].isTheSameConstraint(as: bottomConstraint))
    }
    
}
