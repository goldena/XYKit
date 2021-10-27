//
//  UIView+SuperviewTests.swift
//
//  Created by Denis Goloborodko on 26.10.21.
//

import XCTest
@testable import XYKit

final class UIViewSuperviewTests: XCTestCase {

    // MARK: - SUT
    private var sut: UIView!
    
    private var mainView: UIView!
    private var stackView: UIStackView!
    
    private var view1: UIView!
    private var view2: UIView!
    
    // MARK: - SUT Lifecycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mainView = UIView()
        stackView = UIStackView()
        
        view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(view1)

        view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view2)
    }
    
    override func tearDownWithError() throws {
        sut = nil

        view1 = nil
        view2 = nil

        mainView = nil
        stackView = nil
        
        try super.tearDownWithError()
    }

    func test_view_cannot_become_superview_of_itself() {
        view1.superview(is: view1)
        
        XCTAssertIdentical(view1.superview, mainView)
        
        view2.superview(is: view2)
        
        XCTAssertIdentical(view2.superview, stackView)
    }
    
    func test_view_is_already_subview_of_this_superview() {
        view1.superview(is: mainView)
        
        XCTAssertIdentical(view1.superview, mainView)
        
        view2.superview(is: stackView)
        
        XCTAssertIdentical(view2.superview, stackView)
    }
    
    func test_superview_changes() {
        view1.superview(is: view2)
        
        XCTAssertIdentical(view1.superview, view2)
        
        view2.superview(is: mainView)
        
        XCTAssertIdentical(view2.superview, mainView)
    }
    
    func test_view_is_added_as_arranged_to_stackView() {
        view1.superview(is: stackView)
        
        XCTAssertNotNil(stackView.arrangedSubviews.firstIndex(of: view1))
    }
    
}
