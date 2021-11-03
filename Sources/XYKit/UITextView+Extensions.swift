//
//  UITextView+Extensions.swift
//  textRecognitionSample
//
//  Created by Denis Goloborodko on 1.11.21.
//

import UIKit

extension UITextView {

    @discardableResult
    func withDoneButton(toolBarHeight: CGFloat = 44) -> UITextView {
        guard UIDevice.current.userInterfaceIdiom == .phone else {
            print("Adding Done button to the keyboard makes sense only on iPhones, returning Self with no Done button added")
            return self
        }
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: toolBarHeight))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endEditing))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        inputAccessoryView = toolBar
        
        return self
    }

    @discardableResult
    func adjustableForKeyboard() -> UITextView {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        return self
    }
    
    @objc private func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = convert(keyboardScreenEndFrame, from: window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            contentInset = .zero
        } else {
            contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - safeAreaInsets.bottom, right: 0)
        }

        scrollIndicatorInsets = contentInset
        scrollRangeToVisible(selectedRange)
    }

    
}

