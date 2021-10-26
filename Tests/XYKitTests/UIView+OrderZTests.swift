//
//  UIView+OrderZTests.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewOrderZTests: XCTestCase {
    
    // MARK: - SUT
    
    private var sut: Int!
    
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

    func test_OrderZ_front() {
        sut = mainView.subviews.firstIndex(of: view2)
        
        view2.orderZ(to: .back)
        
        XCTAssertNotEqual(sut, mainView.subviews.firstIndex(of: view2))
    }
    
    func test_orderZ_back() {
        sut = mainView.subviews.firstIndex(of: view1)
        
        view1.orderZ(to: .front)
        
        XCTAssertNotEqual(sut, mainView.subviews.firstIndex(of: view1))
    }
    
}
