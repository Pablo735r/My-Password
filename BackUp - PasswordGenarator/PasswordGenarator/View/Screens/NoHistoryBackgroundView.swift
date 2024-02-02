//
//  NoHistoryView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 22/1/24.
//

import SwiftUI

struct NoHistoryBackgroundView: View {
    
    var title: String
    
    var body: some View {
        
        ZStack {
            
            BackgroundStyleView(topColor: Color.gray, bottomColor: Color.white)
                .opacity(0.4)
            
            Text(title)
                .bold()
                .padding(10)
                .font(.system(size: 20))
                .font(.subheadline)
                .foregroundColor(.gray)
                
        }
    }
}

#Preview {
    NoHistoryBackgroundView(title: "No history")
}
