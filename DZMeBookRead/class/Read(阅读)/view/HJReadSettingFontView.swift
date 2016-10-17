//
//  HJReadSettingFontView.swift
//  HJProject
//
//  Created by 邓泽淼 on 16/8/17.
//  Copyright © 2016年 HanJue. All rights reserved.
//

import UIKit

protocol HJReadSettingFontViewDelegate:NSObjectProtocol {
    
    /**
     字体发生变化的时候调用
     */
    func readSettingFontView(readSettingFontView:HJReadSettingFontView,changeFont font:HJReadFont)
}

class HJReadSettingFontView: HJReadSettingCustomView {
    
    // 代理
    weak var delegate:HJReadSettingFontViewDelegate?
    
    /// 当前选中的按钮
    private var selectButton:UIButton?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        nomalNames = ["系统","黑体","楷体","宋体"]
        
        addSubviews()
        
        titleLabel.text = "字体"
        
        for button in Buttons {
            
            button.contentHorizontalAlignment = .Center
            
            button.addTarget(self, action: #selector(HJReadSettingFontView.clickButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        if !Buttons.isEmpty {
            
            clickButton(Buttons[HJReadConfigureManger.shareManager.readFont.rawValue])
        }
    }
    
    // 点击按钮
    func clickButton(button:UIButton) {
        
        if selectButton == button {return}
        
        selectButton?.selected = false
        
        button.selected = true
        
        selectButton = button
        
        let readFont = HJReadFont(rawValue: button.tag)!
        
        HJReadConfigureManger.shareManager.readFont = readFont
        
        delegate?.readSettingFontView(self, changeFont: readFont)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
