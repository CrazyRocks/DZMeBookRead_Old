//
//  String+Extension.swift
//  BlockPlay
//
//  Created by 邓泽淼 on 16/7/23.
//  Copyright © 2016年 DZM. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var length:Int {
        get{return (self as NSString).length}
    }
    
    /**
     String 转换 intValue = int32Value
     
     - returns: Int
     */
    func int32Value() ->Int32{
        return NSString(string: self).intValue
    }
    
    /**
     String 转换 integerValue
     
     - returns: Int
     */
    func integerValue() ->Int{
        return NSString(string: self).integerValue
    }
    
    /**
     String 转换 floatValue
     
     - returns: float
     */
    func floatValue() ->Float{
        return NSString(string: self).floatValue
    }
    
    /**
     String 转换 CGFloatValue
     
     - returns: CGFloat
     */
    func CGFloatValue() ->CGFloat{
        return CGFloat(self.floatValue())
    }
    
    /**
     String 转换 doubleValue
     
     - returns: double
     */
    func doubleValue() ->Double{
        return NSString(string: self).doubleValue
    }
    
    /**
     截取字符串
     
     - returns: String
     */
    func substringWithRange(range:NSRange) ->String {
        
        return NSString(string: self).substringWithRange(range)
    }
    
    /**
     获得文件的后缀名（不带'.'）
     
     - returns: String
     */
    func pathExtension() ->String {
        
        return NSString(string: self).pathExtension
    }
    
    /**
     从路径中获得完整的文件名（带后缀）
     
     - returns: String
     */
    func lastPathComponent() ->String {
        
        return NSString(string: self).lastPathComponent
    }
    
    /**
     获得文件名（不带后缀）
     
     - returns: String
     */
    func stringByDeletingPathExtension() ->String {
        
        return NSString(string: self).stringByDeletingPathExtension
    }
    
    /**
     字符串MD5加密
     
     - returns: MD5加密好的字符串
     */
    func md5() ->String!{
        
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< digestLen {
            
            hash.appendFormat("%02x", result[i])
        }
        
        result.destroy()
        
        return String(format: hash as String)
    }
    
    /// 计算字符串大小
    func size(font:UIFont) ->CGSize {

       return size(font, constrainedToSize:CGSizeMake(CGFloat.max, CGFloat.max))
    }
    
    /// 计算字符串大小
    func size(font:UIFont,constrainedToSize:CGSize) ->CGSize {
        
        let string:NSString = self as NSString
        
        return string.boundingRectWithSize(constrainedToSize, options: [.UsesLineFragmentOrigin,.UsesFontLeading], attributes: [NSFontAttributeName:font], context: nil).size
    }
    
}

extension NSAttributedString{
    
    /// 计算多态字符串的size
    func size(constrainedToSize:CGSize?) ->CGSize{
        
        var tempConstrainedToSize = constrainedToSize
        
        if constrainedToSize == nil {tempConstrainedToSize = CGSizeMake(CGFloat.max, CGFloat.max)}
        
        return self.boundingRectWithSize(tempConstrainedToSize!, options: [NSStringDrawingOptions.UsesLineFragmentOrigin,NSStringDrawingOptions.UsesFontLeading], context: nil).size
    }
}