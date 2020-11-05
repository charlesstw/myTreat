
//
//  JoinTreatVM.swift
//  iOS
//
//  Created by Charles on 2020/11/5.
//

import SwiftUI

class JoinTreatVM {
    private(set) var campaigns: [Campaign] = testCampaigns
    
    init() {
        fetchCampaign()
    }
    
    func fetchCampaign() {
        // query firebase db
    }
}
