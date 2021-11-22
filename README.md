# NiceAlertView
### _Nice and beautiful AlertView for your iOS project_
NiceAlertView is a Swift framework that can increase time of development and show nice custom AlertsViews

Screenshots
---------
<img src="nice_alertview_screenshot.png" width="200">


Usage
---------
```swift
let popUp = PopUpView()
popUp.setup(title: "Title",
            subtitle: "This is a nice text for a NiceAlertView made in swift for iOS apps",
            btnConfirm: "Ok",
            btnCancel: "cancel",
            { _ in })
self.view.addSubview(popUp)
```

## License

MIT
