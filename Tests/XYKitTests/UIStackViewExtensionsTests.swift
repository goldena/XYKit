//
//  UIStackViewExtensionsTests.swift
//  
//
//  Created by Denis Goloborodko on 24.10.21.
//

import XCTest
@testable import XYKit

final class UIStackViewExtensionsTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: UIStackView!
    
    private var view1: UIView!
    private var view2: UIView!
    
    // MARK: - SUT Lifecycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = UIStackView()
        
        view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        sut.addArrangedSubview(view1)

        view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        sut.addArrangedSubview(view2)
    }
    
    override func tearDownWithError() throws {
        view1 = nil
        view2 = nil

        sut = nil
        
        try super.tearDownWithError()
    }
    
    func test_insets_all() {
        sut.insets(10)

        XCTAssertTrue(sut.isLayoutMarginsRelativeArrangement)
        
        XCTAssertEqual(sut.layoutMargins, UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func test_insets_UIEdgeInsets() {
        sut.insets(UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20))
        
        XCTAssertTrue(sut.isLayoutMarginsRelativeArrangement)
        
        XCTAssertEqual(sut.layoutMargins, UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20))
    }
    
    func test_insets_leftTopRightBottom() {
        sut.insets(left: 5, top: 10, right: 15, bottom: 20)
        
        XCTAssertTrue(sut.isLayoutMarginsRelativeArrangement)
        
        XCTAssertEqual(sut.layoutMargins, UIEdgeInsets(top: 10, left: 5, bottom: 20, right: 15))
    }

    func test_insets_returns_the_same_UIStackView() {
        XCTAssertIdentical(sut, sut.insets(20))
    }
    
    func test_spacing() {
        sut.spacing(20)
        
        XCTAssertEqual(sut.spacing, 20)
    }
    
    func test_spacing_returns_the_same_UIStackView() {
        XCTAssertIdentical(sut, sut.spacing(20))
    }
}
