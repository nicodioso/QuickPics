//
//  BaseViewModel.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    weak var clients: Clients?
    
    init(clients: Clients? = .live) {
        self.clients = clients
    }
}
