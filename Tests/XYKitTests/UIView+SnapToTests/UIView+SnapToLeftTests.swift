//
//  UIView+SnapToLeftTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToLeftTests: XCTestCase {
    
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
    
    func test_snapTo_left_anchor() {
        sut = view1.left(snapTo: view2.left)
        
        let constraint = view1.leftAnchor.constraint(equalTo: view2.leftAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_left_view() {
        sut = view1.left(snapTo: view2)
        
        let constraint = view1.leftAnchor.constraint(equalTo: view2.leftAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_left_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.left(snapTo: .safeArea)
        
        let constraint = view2.leftAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leftAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_left_margin() {
        sut = view1.left(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.leading
        let constraint = view1.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_left_padding() {
        sut = view1.left(snapTo: .padding(20))
        
        let constraint = view1.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}

