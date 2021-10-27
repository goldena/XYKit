# XYKit

## Swifty and convenient domain specific language for creating programmatic UI in a more declarative way and more than that. Built on top of UIKit using extensions-only minimalistic approach.

Installation using Swift Package Manager:
- 1. Open your project in Xcode or make a new one
- 2. Select it it at the top of the Project Navigator (left panel with file structure of your project)
- 3. Switch to Package Dependencies tab
- 4. Tap plus to add a new dependancy
- 5. In the top rightmost corner of the window paste this link https://github.com/goldena/XYKit into the search field
- 6. You can tap twice on the newly added dependency to choose its update rules. The best approach in terms of maintainability is to select Version rules, for example from 2.0.0 till 3.0.0 to make sure a new major version of the dependency will not have any API breaking changes.

## Features:

- No need to manually activate newly created constraints: '.isActive = true'

- No need to 'translatesAutoresizingMaskIntoConstraints = false', no need to 'addArrangedSubview()' if you are adding subviews using:

```swift
someView.superview(is: view) // Which I consider more natural than 'view.addSubview(someView)'

view.subview(is: aView)
view.subviews(are: anotherView, yetAnotherView)
```

### Example 1:

```swift
// UIKit:
view.addSubview(label)
label.translatesAutoresizingMaskIntoConstraints = false

view.addSubview(imageView)
imageView.translatesAutoresizingMaskIntoConstraints = false

imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true

// XYKit:
view.subviews(are: label, imageView)

imageView.width(32)
imageView.height(64)

// Or even shorter:
imageView.size(width: 32, height: 64)

// What if constraints were inequalities like these:
imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 32).isActive = true
imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 64).isActive = true

// XYKit:
imageView.size(width: 32, height: 64, or: .less)
```

### Example 2:

```swift
imageView.leading(snapTo: .margin)                          // Constraint leading anchor of the imageView to the leading margin of the superview
imageView.centerY()                                         // Center view in superview

label.leading(snapTo: gameImageView.trailing).offset(16)    // Constraint leading anchor of the label's trailing anchor, plus constant
```

- As you might have noticed method chaining is available. Keep in mind though that every func in XYKit returns either a view or a constraint(s) as @discardableResult, thus in order to use chaining you have to consider a moment when a view becomes a constraint(s). That is quite easy - it happens when you 'snapTo' or 'center', or change 'size'. In case of doubts feel free to check func type signature.

### Example 3:

```swift
tableView.sidesX(snapTo: .padding(20))          // Constraint horizontal sides to leading and trailing anchors of superview with the padding of 20
tableView.centerX()                             // Center tableView in superview

tableView.top(snapTo: .safeArea)                // Constraint top anchor of tableView to screen's safe area.
tableView.bottom(snapTo: self)                  // Constraint bottom anchor of tableView to superview's bottom anchor
```

### Example 4:
```swift
mainStackView
            .superview(is: self)
            .subviews(are: titleStackView, timeStackView)
            .insets(left: 8, top: 8, right: 16, bottom: 16) // insets for UIStackView
            .spacing(20)                                    // spacing between arranged subviews inside UIStackView
            .sides(snapTo: .safeArea)                       // Snap all sides to the screen's safe areas
        
let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
imageView.tappable(with: tap)                               // Another extension for UIView                
```

##Disclaimer: this is my initial take on the XYKit, there is a lot of space for refactoring, improvements and no doubt - some bugs to be found and squashed. Contributions, suggestions, pull requests are welcomed and encouraged.
