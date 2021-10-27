//
//  UIPageControl+ConvenienceInit.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIPageControl {
    
    convenience init(numberOfPages: Int, currentPage: Int = 0) {
        self.init()

        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
    }
    
}
