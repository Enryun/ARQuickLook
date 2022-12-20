//
//  ContentView.swift
//  USDzExperience
//
//  Created by user on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Home()
        }
        .preferredColorScheme(.dark)
    }
}

