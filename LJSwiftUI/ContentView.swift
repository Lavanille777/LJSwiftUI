//
//  ContentView.swift
//  LJSwiftUI
//
//  Created by 唐星宇 on 2020/8/20.
//  Copyright © 2020 唐星宇. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    ///键盘高度
    @State var keyBoardHeight: CGFloat = 0
    
    @State var cardBottom: CGFloat = WidthScale(160)
    
    let keyboardWillShow: NotificationCenter.Publisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    
    let keyboardWillHide: NotificationCenter.Publisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                loginTitle()
                    .padding(.top, WidthScale(42))
                Spacer()
                cardView()
                    .padding(.bottom, cardBottom)
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
        }
        .onReceive(keyboardWillShow) { (output) in
            self.keyboardWillShow(output: output)
        }
        .onReceive(keyboardWillHide) { (output) in
            self.keyboardWillHide(output: output)
        }
        
    }
    
    func keyboardWillShow(output: Notification) {
        let userInfo: NSDictionary = output.userInfo! as NSDictionary
        let value = userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)
        let keyboardRec = (value as AnyObject).cgRectValue
        keyBoardHeight = keyboardRec?.size.height ?? 0
        withAnimation(.easeInOut(duration: 0.25)) {
            cardBottom = keyBoardHeight
        }
        
    }
    
    func keyboardWillHide(output: Notification) {
        let userInfo: NSDictionary = output.userInfo! as NSDictionary
        let value = userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)
        let keyboardRec = (value as AnyObject).cgRectValue
        keyBoardHeight = keyboardRec?.size.height ?? 0
        withAnimation(.easeInOut(duration: 0.25)) {
            cardBottom = WidthScale(160)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct cardView: View {
    
    @State var nickName: String = ""
    
    var mainView: MainView = MainView()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Button(action: {
                print("点击头像")
            }, label: {
                Image("avatar")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: WidthScale(90), height: WidthScale(90), alignment: .center)
            }).padding(.bottom, WidthScale(30))
            
            TextField("起个好听的昵称吧", text: $nickName)
                .padding()
                .keyboardType(.default)
                .font(.custom(FontYuanTiBold, size: 16))
                .multilineTextAlignment(.center)
                .frame(width: WidthScale(208), height: WidthScale(46), alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: WidthScale(20)).stroke(Color(HEXCOLOR(h: 0xbbbbbb, alpha: 1.0)), lineWidth: 1)).padding(.bottom, WidthScale(20))
            
            NavigationLink(destination: mainView.navigationBarBackButtonHidden(false)) {
                Text("确定")
                    .font(.custom(FontYuanTiBold, size: 18))
                    .foregroundColor(Color(HEXCOLOR(h: 0xD2691E, alpha: 1.0)))
                    .frame(width: WidthScale(208), height: WidthScale(46), alignment: .center)
                    .background(Color(HEXCOLOR(h: 0xFFC0CB, alpha: 1.0)))
                    .cornerRadius(WidthScale(20))
            }
            
        })
            .frame(width: WidthScale(280), height: WidthScale(300), alignment: .center)
            .background(Color.white)
            .cornerRadius(WidthScale(10))
            .shadow(color: Color(HEXCOLOR(h: 0xaaaaaa, alpha: 0.5)), radius: 10, x: 0, y: 0)
    }
}

struct loginTitle: View {
    var body: some View {
        Text("こ ん に ち は")
            .font(.custom(FontYuanTiBold, size: WidthScale(30)))
            .foregroundColor(Color(HEXCOLOR(h: 0xFFC0CB, alpha: 1.0)))
    }
}
