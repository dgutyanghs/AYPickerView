#AYPickerDataView
=================
###A pickerView library for iOS
###滚动选择条 
----

###Screenshots
---
<img src="Screenshots/AYPickerViewShot1.png"" width="320px" />


###How to use
###如何使用
---
#### #import "AYPickerDataView.h"

    
    HLPickerCellView *cellView = [HLPickerCellView viewWithFrame:frame Name:@"Age" unit:@"Year" valueRangeFromMin:@0 toMax:@100 defaultValue:@25 andOwner:self   type:HLPersonCellViewEnumAge];
    
	cellView.scaleBackgroundColor = [UIColor yellowColor];
    cellView.scaleColor = [UIColor blueColor];
    cellView.scaleBorderWidth = 3.0;
    cellView.scaleCursorColor = [UIColor redColor];
    cellView.resultTextColor = [UIColor magentaColor];
        
### happy hacking, enjoy!
 
 
    
    

    
