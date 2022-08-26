//
//  ContentView.swift
//  TeslaUIDesign
//
//  Created by Ömer Faruk Kılıçaslan on 26.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ScrollView {
                
                VStack(spacing: 20){
                    HomeHeader()
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                    CategoryView(title: "Quick Shortcuts", showEdit: true)
                    CustomDivider()
                    CategoryView(title: "Recent Actions", showEdit: true)
                }
                .padding()
                
            }
            
            VoiceCommandButton()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black).opacity(0.92)
        .foregroundColor(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VoiceCommandButton: View {
    var body: some View {
        
        VStack{
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .frame(width: 64, height: 64)
                    .background(Color.green)
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                Text("Model 3".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            Spacer()
            HStack{
                Button {
                    
                } label: {
                    GeneralButton(icon: "lock.fill")
                }
                
                Button {
                    
                } label: {
                    GeneralButton(icon: "gear")
                }


                
                
            }
        }
        .padding(.top)
    }
}

struct GeneralButton: View {
    
    var icon: String
    
    var body: some View {
        
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
            .overlay{
                Circle()
                    .stroke(Color.white, lineWidth: 1)
            }
        
    }
}

struct CustomDivider: View {
    var body: some View{
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
            .background(Color.white)
            .opacity(0.5)
    }
}


struct CarSection: View {
    var body: some View {
        
        VStack(spacing: 10){
            HStack(alignment: .center){
                HStack{
                    Image(systemName: "battery.75")
                    Text("237 miles".uppercased())
                    
                }
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(.green)
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last updated: 5 min ago")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            Image("tesla")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}


struct CategoryHeader: View {
    
    var title: String
    var showEdit: Bool = false
    
    var body: some View {
            HStack(alignment: .center){
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                
                if showEdit {
                    Button {
                        
                    } label: {
                        Text("Edit")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                    }
                }
        }
    }
}

struct CategoryView: View {
    
    var title: String
    var showEdit: Bool = false
    
    var body: some View {
        
        VStack{
            CategoryHeader(title: title, showEdit: showEdit)
                .padding(.bottom, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top){
                    ActionButton(icon: "bolt.fill", text: "Charging")
                    ActionButton(icon: "fanblades.fill", text: "Fan On")
                    ActionButton(icon: "music.note", text: "Media Controls")
                    ActionButton(icon: "bolt.car", text: "Close Charging Port")
                }
                
            }
        }
    }
}


struct ActionButton: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralButton(icon: icon)
            Text(text)
                .frame(width: 72)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)

        }
    }
}
