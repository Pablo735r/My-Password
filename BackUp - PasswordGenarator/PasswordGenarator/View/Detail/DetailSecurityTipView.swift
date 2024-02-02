//
//  DetailSecurityTipView.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 25/1/24.
//

import SwiftUI

struct DetailSecurityTipView: View {
    
    let tip: Tips
    
    var body: some View {
        
        ZStack {
            
            NoHistoryBackgroundView(title: "")
            
            VStack(spacing: 30) {
                
                Image(systemName: "checkmark.shield.fill")
                    .resizable()
                    .frame(width: 65, height: 75)
                    .foregroundStyle(.red)
                
                Text("\(tip.title).")
                    //.bold()
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6) // shrink text
                    .padding()
                
                Text(tip.tip)
                    .fontWeight(.regular)
            }
            .padding(.bottom, 100)
        .padding()
        }
    }
}

#Preview {
    DetailSecurityTipView(tip: sampleTips)
}
