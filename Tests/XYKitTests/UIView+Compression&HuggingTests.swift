//
//  UIView+CompressionAndHuggingTests.swift
//  
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewCompressionAndHuggingTests: XCTestCase {
    
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

    func test_resistanceX() {
        sut.resistanceX(.required)
        
        XCTAssertEqual(sut.contentCompressionResistancePriority(for: .horizontal), UILayoutPriority.required)
    }
    
    func test_resistanceY() {
        sut.resistanceY(.required)
        
        XCTAssertEqual(sut.contentCompressionResistancePriority(for: .vertical), UILayoutPriority.required)
    }
    
    func test_resistanceXY() {
        sut.resistanceX(.required)
        sut.resistanceY(.required)
        
        XCTAssertEqual(sut.contentCompressionResistancePriority(for: .horizontal), UILayoutPriority.required)
        XCTAssertEqual(sut.contentCompressionResistancePriority(for: .vertical), UILayoutPriority.required)
    }
    
    func test_huggingX() {
        sut.huggingX(.required)
        
        XCTAssertEqual(sut.contentHuggingPriority(for: .horizontal), UILayoutPriority.required)
    }
    
    func test_huggingY() {
        sut.huggingY(.required)
        
        XCTAssertEqual(sut.contentHuggingPriority(for: .vertical), UILayoutPriority.required)
    }
    
    func test_huggingXY() {
        sut.huggingXY(.required)
        
        XCTAssertEqual(sut.contentHuggingPriority(for: .horizontal), UILayoutPriority.required)
        XCTAssertEqual(sut.contentHuggingPriority(for: .vertical), UILayoutPriority.required)
    }
    
}
