# Hamburger Menu Button
A hamburger menu button with full customization. Inspired by [VinhLe's idea on the Dribble](https://dribbble.com/shots/1626236-Dribbble-Menu)

![Preview]
(http://i.imgur.com/jeaLTWt.gif)

# How to use it
You can config the looks of the button through Xcode Inspector

![Xcode Inspector]
(http://i.imgur.com/vRn2Quu.gif)

Or you can make a button on your own by doing this:
```
    let firstButton = MenuButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    firstButton.center = CGPoint(x: self.view.bounds.width/2, y: 350)
    firstButton.addTarget(self, action: #selector(ViewController.buttonClick(_:)), for: UIControlEvents.touchUpInside)
    firstButton.lineWidth = 30
    firstButton.lineMargin = 12
    firstButton.lineCapRound = true
    firstButton.thickness = 6
    firstButton.slideLeftToRight = false
    firstButton.backgroundColor = UIColor.purple
    firstButton.cornerRadius = 10
    self.view.addSubview(firstButton)
```
# License
MIT license. See the `LICENSE` file for details.
