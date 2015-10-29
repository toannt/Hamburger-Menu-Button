# MenuButton
A hamburger menu button with full customization. Inspired by [VinhLe's idea on the Dribble](https://dribbble.com/shots/1626236-Dribbble-Menu)

![Preview]
(http://i.imgur.com/jeaLTWt.gif)

# How to use it
You can config the looks of the button through Xcode Inspector

![Xcode Inspector]
(http://i.imgur.com/vRn2Quu.gif)

Or you can make a button on your own by doing this:
```
  let firstButton = MenuButton(frame: CGRectMake(100, 100, 60, 60))
  firstButton.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
  firstButton.lineWidth = 30
  firstButton.lineMargin = 12
  firstButton.lineCapRound = true
  firstButton.thickness = 6
  firstButton.slideLeftToRight = false
  firstButton.backgroundColor = UIColor.purpleColor()
  firstButton.cornerRadius = 10
  self.view.addSubview(firstButton)
```
