//
//  ProgressBar.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 26/11/22.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var isShowing = false
    @State var progress: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color.gray)
                .opacity(0.3)
                .frame(width: 345.0, height: 10.0)
            
            Rectangle()

                .foregroundColor(colorScheme == .light ? Color(.systemOrange) : .white)
                .frame(width: self.isShowing ? 345.0 * (self.progress / 24.0) : 0.0, height: 10.0)
                .animation(Animation.linear(duration: 1.0), value: 1)
        }
        .onAppear {
            self.isShowing = true
        }
        .cornerRadius(4.0)
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 24.0)
    }
}

