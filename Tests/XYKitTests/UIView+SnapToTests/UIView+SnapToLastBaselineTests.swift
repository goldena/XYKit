//
//  UIView+SnapToLastBaselineTests.swift
//  
//  Created by Denis Goloborodko on 25.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToLastBaselineTests: XCTestCase {
    
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
    
    func test_snapTo_lastBaseline_anchor() {
        sut = view1.lastBaseline(snapTo: view2.lastBaseline)
        
        let constraint = view1.lastBaselineAnchor.constraint(equalTo: view2.lastBaselineAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_lastBaseline_view() {
        sut = view1.lastBaseline(snapTo: view2)
        
        let constraint = view1.lastBaselineAnchor.constraint(equalTo: view2.lastBaselineAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_lastBaseline_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.lastBaseline(snapTo: .safeArea)
        
        let constraint = view2.lastBaselineAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_lastBaseline_margin() {
        sut = view1.lastBaseline(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.trailing
        let constraint = view1.lastBaselineAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_lastBaseline_padding() {
        sut = view1.lastBaseline(snapTo: .padding(20))
        
        let constraint = view1.lastBaselineAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}
