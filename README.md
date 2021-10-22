# XYKit

## Swifty and convenient domain specific language for creating programmatic UI in a more declarative way and more than that. Built on top of UIKit using extensions-only minimalistic approach.

- No need to manually activate newly created constraints: '.isActive = true'

- No need to 'translatesAutoresizingMaskIntoConstraints = false', no need to 'addArrangedSubview()' if you are adding subviews using:

```swift
someView.superview(is: view)

view.subview(is: aView)
view.subviews(are: anotherView, yetAnotherView)
```

### Example 1:

```swift
// Vanilla:
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
view.subviews(are: label, imageView)

imageView.size(width: 32, height: 64)

// What if constraints were inequalities like these:
imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 32).isActive = true
imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 64).isActive = true

// XYKit:
imageView.size(width: 32, height: 64, or: .less)
```

### Example 2:

```swift
imageView.leading(snapTo: .margin) // Constraint leading anchor of the imageView to the leading margin of the superview
imageView.centerY() // Center view in superview

label.leading(snapTo: gameImageView.trailing).offset(16) // Constraint leading anchor of the label's trailing anchor, plus constant
```

- As you might have noticed method chaining is available. Keep in mind though that every func in XYKit returns either a view or a constraint(s) as @discardableResult, thus in order to use chaining you have to consider a moment when a view becomes a constraint(s). That is quite easy - it happens when you 'snapTo' or 'center', or change 'size'. In case of doubts feel free to check func type signature.

### Example 3:

```swift
tableView.sidesX(snapTo: .padding(20)) // Constraint sides to leading and trailing anchors of superview with the padding of 20
tableView.centerX() // Center tableView in superview

tableView.top(snapTo: .safeArea) // Constraing top anchor of tableView to screen's safe area.
tableView.bottom(snapTo: self) // Constraint bottom anchor of tableView to superview's bottom anchor
```

```swift
mainStackView
            .superview(is: self)
            .subviews(are: titleAndImageStackView, playtimeStackView)
            .insets(left: 8, top: 8, right: 16, bottom: 16)
            .spacing(20)
            .sides(snapTo: .safeArea)
        
        titleAndImageStackView
            .subviews(are: gameTitle, gameImageView)

        let tap = UITapGestureRecognizer(target: self, action: #selector(gameImageViewTapped))
        gameImageView.tappable(with: tap)
        
        playtimeStackView
            .insets(left: 20, right: 20)
            .subviews(are:
                playtimeTotalStackView,
                playtimeWindowsStackView,
                playtimeMacStackView,
                playtimeLinuxStackView,
                playtimeSegmentedControl
            )
                
        playtimeSegmentedControl.addTarget(self, action: #selector(playtimeSegmentedControlValueChanged), for: .valueChanged)
        
        playtimeTotalStackView
            .subviews(are: playtimeTotalTitle, playtimeTotalLabel)
        playtimeWindowsStackView
            .subviews(are: playtimeWindowsTitle, playtimeWindowsLabel)
        playtimeMacStackView
            .subviews(are: playtimeMacTitle, playtimeMacLabel)
        playtimeLinuxStackView
            .subviews(are: playtimeLinuxTitle, playtimeLinuxLabel)
```
