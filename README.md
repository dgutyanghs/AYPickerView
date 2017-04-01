<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#org42c2dae">1. AYPickerDataView</a>
<ul>
<li><a href="#orgb32b84d">1.1. A pickerView library for iOS 滚动选择条</a></li>
<li><a href="#org46dae34">1.2. Screenshots</a></li>
<li><a href="#org0d21501">1.3. How to use</a></li>
<li><a href="#org58c3375">1.4. 如何使用</a></li>
<li><a href="#orgf1aaac8">1.5. 更新</a></li>
<li><a href="#org6003c4b">1.6. happy hacking, enjoy!</a></li>
</ul>
</li>
</ul>
</div>
</div>

<a id="org42c2dae"></a>

# AYPickerDataView


<a id="orgb32b84d"></a>

## A pickerView library for iOS 滚动选择条


<a id="org46dae34"></a>

## Screenshots

&#x2014;

    <img src="Screenshots/AYPickerViewShot1.png" width="320px" />&nbsp;
    <img src="Screenshots/AYPickerViewShot2.png" width="320px" />


<a id="org0d21501"></a>

## How to use


<a id="org58c3375"></a>

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


<a id="orgf1aaac8"></a>

## 更新

添加一个渐变layer， 使滚动栏具有立体感。


<a id="org6003c4b"></a>

## happy hacking, enjoy!

