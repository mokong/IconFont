## [**IconFont的使用**](https://github.com/mokong/IconFont)

### [github链接](https://github.com/mokong/IconFont)

### 背景： 最近设计提了要求，切图用IconFont

一开始，在搜了IconFont的使用后，选中了TBCityIconFont，使用了之后，发现对于图片的支持不太好，就是长宽不等的图片，显示的时候会被截断，在具体实现里也没发现修改的地方。

然后就pass了，换了另一个Swift的Iconic的第三方库，这个库有个好处，是可以自动把.ttf文件里的Icon生成一个枚举使用的时候特别方便。然而缺点是安装的时候麻烦，之前只是稍微麻烦，最近变得特别麻烦，需要设置FONT_PATH。而且不支持最新版本的Swift，每次更新.ttf字体文件，都要改一次。

实在是受不了了，今天就抽空自己写(抄)了一个。😄有兴趣的可以自己看参考链接，其实就是参考链接里内容的整合。

### 实现
首先，我想要的是，传入一个Int类型(eg: 0xe654)或者字符串类型(eg :\u{E61A})都支持。 然后如果是本地的文件，我希望可以不用手动收入unicode码。最后就是图片支持宽高不等的显示。

整体的原理是[Working with icon fonts in iOS. Code example in Swift 3.](https://medium.com/@ankoma22/working-with-icon-fonts-in-ios-code-example-in-swift-3-561d47ae9d40)和[github Iconic](https://github.com/dzenbot/Iconic)的结合。

1. 首先是传入类型的支持，定义两个类方法，一个传入Int，一个传入String，然后再实现一个Int->String的方法，然后根据String实现具体内容。

2. 本地文件每次收入unicode吗不方便，定义两个枚举类型，一个是enum string，一个是enum UInt32，定义UInt32是为了可以兼容OC。如果纯Swift只需要使用enum String即可。

3. 图片宽高不等的显示：关键代码如下
```Swift

...xxx
        var rect = CGRect(origin: CGPoint.zero, size: size)
        rect.origin.y -= edgeInsets.top
        rect.size.width -= edgeInsets.left + edgeInsets.right // 运算符优先级注意
        rect.size.height -= edgeInsets.top + edgeInsets.bottom

...xxx

```

### **使用**
1. 来自[iconfont怎么在iOS中使用了](https://blog.csdn.net/qq_14920635/article/details/78408761)
   [![Screen Shot 2019-05-02 at 18.01.24.png](https://i.loli.net/2019/05/02/5ccac0097a219.png)](https://i.loli.net/2019/05/02/5ccac0097a219.png)

2. 将MWIconFont.Swift添加到项目中

3. 修改文件中两个地方，

[![Screen Shot 2019-05-02 at 18.03.39.png](https://i.loli.net/2019/05/04/5cccf96cc000c.png)](https://i.loli.net/2019/05/04/5cccf96cc000c.png)

[![Screen Shot 2019-05-02 at 18.03.52.png](https://i.loli.net/2019/05/04/5cccf9a0385ab.png)](https://i.loli.net/2019/05/04/5cccf9a0385ab.png)

4. 使用

Swift label使用，生成attributeString

```Swift
        // 使用枚举Str
        let attributeStr = MWIconFont.attributedString(fromIconStr: MWFontIcon.yuedufuHuodeIcon.rawValue, size: 50.0, color: UIColor.red)
        displayLabel.attributedText = attributeStr

        // 使用枚举Int
        let attributeStr1 = MWIconFont.attributedString(fromIconInt: MWFontIconInt.yuedufuHuodeIcon.rawValue, size: 50.0, color: UIColor.blue)
        displayLabel.attributedText = attributeStr1

```
OC label使用，生成attributeString
``` Swift
NSMutableString *jiantouStr = [MKIconFont attributedStringFromIconInt:MKFontIconIntZuojiantouIcon size:CGSizeMake(19.0, 19.0) color:[UIColor redColor]];
```

Swift 生成image

```Swift
        // 使用枚举Str
        let image =  MWIconFont.image(fromIconStr: MWFontIcon.yuedufuHuodeIcon.rawValue, size: CGSize(width: 30.0, height: 50.0), color: UIColor.cyan, edgeInsets: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0))
        displayImageView.image = image

        // 使用枚举Int
        let image1 = MWIconFont.image(fromIconInt: MWFontIconInt.yuedufuHuodeIcon.rawValue, size: CGSize(width: 30.0, height: 50.0), color: UIColor.blue, edgeInsets:  UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0))
        displayImageView.image = image1

```

OC 生成image
```Swift
        UIImage *backIcon = [MKIconFont imageFromIconInt:MKFontIconIntZuojiantouIcon size:CGSizeMake(19.0, 19.0) color:[UIColor redColor]];

```




### **参考链接**
[Working with icon fonts in iOS. Code example in Swift 3.](https://medium.com/@ankoma22/working-with-icon-fonts-in-ios-code-example-in-swift-3-561d47ae9d40)

[iconfont怎么在iOS中使用了](https://blog.csdn.net/qq_14920635/article/details/78408761)

[Iconfont-阿里巴巴矢量图标库](https://www.iconfont.cn/help/detail?helptype=code)

[github Iconic](https://github.com/dzenbot/Iconic)
