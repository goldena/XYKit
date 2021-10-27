//
//  UIView+AnchorsTests.swift
//  
//  Created by Denis Goloborodko on 24.10.21.
//

import XCTest
@testable import XYKit

final class UIViewAnchorsTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: UIView!
    
    // MARK: - SUT Lifecycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
                
        sut = UIView()
        sut.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func test_leading_is_leadingAnchor() {
        XCTAssertIdentical(sut.leading, sut.leadingAnchor)
    }

    func test_top_is_topAnchor() {
        XCTAssertIdentical(sut.top, sut.topAnchor)
    }
    
    func test_trailing_is_trailingAnchor() {
        XCTAssertIdentical(sut.trailing, sut.trailingAnchor)
    }
    
    func test_bottom_is_bottomAnchor() {
        XCTAssertIdentical(sut.bottom, sut.bottomAnchor)
    }
    
    func test_width_is_widthAnchor() {
        XCTAssertIdentical(sut.width, sut.widthAnchor)
    }

    func test_height_is_heightAnchor() {
        XCTAssertIdentical(sut.height, sut.heightAnchor)
    }
   
    func test_left_is_leftAnchor() {
        XCTAssertIdentical(sut.left, sut.leftAnchor)
    }
    
    func test_right_is_rightAnchor() {
        XCTAssertIdentical(sut.right, sut.rightAnchor)
    }
    
    func test_firstBaseline_is_firstBaselineAnchor() {
        XCTAssertIdentical(sut.firstBaseline, sut.firstBaselineAnchor)
    }

    func test_lastBaseline_is_lastBaselineAnchor() {
        XCTAssertIdentical(sut.lastBaseline, sut.lastBaselineAnchor)
    }
    
}

