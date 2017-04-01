<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#org6662790">1. AYPickerDataView</a>
<ul>
<li><a href="#org0179d73">1.1. A pickerView library for iOS 滚动选择条</a></li>
<li><a href="#orgfc0cff1">1.2. Screenshots</a></li>
<li><a href="#orgde4655b">1.3. How to use</a></li>
<li><a href="#org209d920">1.4. 如何使用</a></li>
<li><a href="#orgc5f3f60">1.5. 更新</a></li>
<li><a href="#org9f911bd">1.6. happy hacking, enjoy!</a></li>
</ul>
</li>
</ul>
</div>
</div>

<a id="org6662790"></a>

# AYPickerDataView


<a id="org0179d73"></a>

## A pickerView library for iOS 滚动选择条


<a id="orgfc0cff1"></a>

## Screenshots

<img src="Screenshots/AYPickerViewShot1.png"" width="320px" />
<img src="Screenshots/AYPickerViewShot2.png"" width="320px" />


<a id="orgde4655b"></a>

## How to use


<a id="org209d920"></a>

## 如何使用

    #import "AYPickerDataView.h"
    
    
       HLPickerCellView *cellView = [HLPickerCellView viewWithFrame:frame Name:@"Age" unit:@"Year" valueRangeFromMin:@0 toMax:@100 defaultValue:@25 andOwner:self   type:HLPersonCellViewEnumAge];
    
     cellView.scaleBackgroundColor = [UIColor yellowColor];
       cellView.scaleColor = [UIColor blueColor];
       cellView.scaleBorderWidth = 3.0;
       cellView.scaleCursorColor = [UIColor redColor];
       cellView.resultTextColor = [UIColor magentaColor];
    
       // add a gradient effect for the ruler
       cellView.gradientEnable = YES;
       cellView.gradientColorCenter = [UIColor colorWithWhite:0 alpha:0];
       cellView.gradientColorCorner = [UIColor colorWithWhite:0 alpha:0.8];


<a id="orgc5f3f60"></a>

## 更新

添加一个渐变layer， 使滚动栏具有立体感。


<a id="org9f911bd"></a>

## happy hacking, enjoy!

