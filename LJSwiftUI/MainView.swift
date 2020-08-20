//
//  MainView.swift
//  LJSwiftUI
//
//  Created by 唐星宇 on 2020/8/20.
//  Copyright © 2020 唐星宇. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var isNavHidden: Bool = false
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea([.top, .bottom])
        }.onAppear {
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
