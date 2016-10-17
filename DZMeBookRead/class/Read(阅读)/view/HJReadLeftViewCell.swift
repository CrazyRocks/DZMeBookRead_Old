//
//  HJReadLeftViewCell.swift
//  HJProject
//
//  Created by 邓泽淼 on 16/8/15.
//  Copyright © 2016年 HanJue. All rights reserved.
//

import UIKit

class HJReadLeftViewCell: UITableViewCell {
    
    /// 分割线
    var spaceLine:UIView!
    
    class func cellWithTableView(tableView:UITableView) ->HJReadLeftViewCell {
        
        let ID = "HJReadLeftViewCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? HJReadLeftViewCell
        
        if (cell == nil) {
            
            cell = HJReadLeftViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ID);
        }
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont.fontOfSize(16)
        
        selectionStyle = UITableViewCellSelectionStyle.None
        
        addSubViews()
    }
    
    func addSubViews() {
        
        // 分割线
        spaceLine = SpaceLineSetup(contentView, color: HJColor_6)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        spaceLine.frame = CGRectMake(0, height - HJSpaceLineHeight, width, HJSpaceLineHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
