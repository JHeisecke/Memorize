//
//  CustomAlertView.swift
//  Memorize!
//
//  Created by Javier Heisecke on 2023-05-16.
//

import SwiftUI

struct CustomAlertView: View {
    
    @State private var text: String = ""
    
    let completion: ((String) -> ())
    
    init(completion: @escaping ((String) -> ())) {
        self.completion = completion
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea(.all, edges: .all)
            VStack {
                top
                    .padding(.horizontal)
                Spacer()
                buttons
            }
            .frame(maxWidth: 300, maxHeight: 260)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        .ignoresSafeArea(.all, edges: .all)
        .ignoresSafeArea(.keyboard)
    }
    
    var top: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Won")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.black)
            Text("Won.Description")
                .font(.system(size: 16, weight: .regular))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.black)
            TextField("Alias", text: $text)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
    }
    
    var buttons: some View {
        VStack {
            Divider()
            HStack() {
                Button {
                    completion(text)
                } label: {
                    Spacer()
                    Text("cancel")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.red)
                    Spacer()
                }
                Divider()
                Button {
                    completion(text)
                } label: {
                    Spacer()
                    Text("save")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.blue)
                    Spacer()
                }
            }
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(completion: { value in
            
        })
    }
}
