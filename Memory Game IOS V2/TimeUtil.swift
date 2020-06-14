//
//  TimeUtil.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/14/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation

class TimeUtil{
    
    public static func secondsToTime(gameSeconds: Int) -> String{
        return String(format: "%02d:%02d", gameSeconds/60, gameSeconds%60)
    }
}
