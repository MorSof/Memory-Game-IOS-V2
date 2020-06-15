//
//  TimeDateUtil.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/15/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation

class TimeDateUtil{
    
    
    public static func secondsToTime(gameSeconds: Int) -> String{
              return String(format: "%02d:%02d", gameSeconds/60, gameSeconds%60)
    }
    
    public static func myDateFormat(date: Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy | HH:mm"
        return formatter.string(from: date)
    }
    
}
