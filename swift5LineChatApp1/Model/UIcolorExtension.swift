//
//  UIcolorExtension.swift
//  swift5LineChatApp1
//
//  Created by 深谷祐斗 on 2020/08/16.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

extension UIColor{
    
    
    static func rgb(red:CGFloat,green:CGFloat,blue:CGFloat)->UIColor{
        
        return self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        
        
        
    }
    
    
}
