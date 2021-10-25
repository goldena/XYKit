//
//  File.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSnapToTopTests: XCTestCase {
    
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
    
    func test_snapTo_top_anchor() {
        sut = view1.top(snapTo: view2.top)
        
        let constraint = view1.topAnchor.constraint(equalTo: view2.topAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_top_view() {
        sut = view1.top(snapTo: view2)
        
        let constraint = view1.topAnchor.constraint(equalTo: view2.topAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_top_safeArea() {
        view1.addSubview(view2)
        
        sut = view2.top(snapTo: .safeArea)
        
        let constraint = view2.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }

    func test_snapTo_top_margin() {
        sut = view1.top(snapTo: .margin)
        
        let margin = view1.directionalLayoutMargins.top
        let constraint = view1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: margin)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
    func test_snapTo_top_padding() {
        sut = view1.top(snapTo: .padding(20))
        
        let constraint = view1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20)
        constraint.isActive = true
                        
        XCTAssertTrue(sut.isTheSameConstraint(as: constraint))
    }
    
}

