//
//  UIViewSnapToRightTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToRightTests: XCTestCase {
    
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
    
    func test_snapTo_right_anchor() {
        sut = view1.right(snapTo: view2.right)
        
        let constraint = view1.rightAnchor.constraint(equalTo: view2.rightAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_right_view() {
        sut = view1.right(snapTo: view2)
        
        let constraint = view1.rightAnchor.constraint(equalTo: view2.rightAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_right_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.right(snapTo: .safeArea)
        
        let constraint = view2.rightAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.rightAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_right_margin() {
        sut = view1.right(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.trailing
        let constraint = view1.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_right_padding() {
        sut = view1.right(snapTo: .padding(20))
        
        let constraint = view1.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}
