//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vinod Sagar on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDayTime: Bool = true
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(
                    colors: [isDayTime ? Color.blue : Color.gray, isDayTime ? Color("lightblue") : Color.gray]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing:40){
                
                Text("London")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                
                VStack(spacing: -4){
                    Image(systemName: isDayTime ? "cloud.sun.fill" : "cloud.moon.rain")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20°")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    
                    
                }
                
                HStack{
                    
                    DayWeather(dayName: "Mon", imageName: "cloud.sun.fill", degreesTemperature: 20)
                    DayWeather(dayName: "Tue", imageName: "sun.max.fill", degreesTemperature: 22)
                    DayWeather(dayName: "Web", imageName: "cloud.sun.fill", degreesTemperature: 19)
                    DayWeather(dayName: "Thr", imageName: "cloud.heavyrain.fill", degreesTemperature: 23)
                    DayWeather(dayName: "Fri", imageName: "cloud.hail.fill", degreesTemperature: 22)
                    DayWeather(dayName: "Sat", imageName: "cloud.sun.bolt.fill", degreesTemperature: 21)
                    DayWeather(dayName: "Sun", imageName: "cloud.sun.fill", degreesTemperature: 25)

                }
                Spacer()
                
                Button(action: {
                    if isDayTime == true{
                        isDayTime = false
                    }else{
                        isDayTime = true
                    }

                    
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280 , height: 30)
                        .background(.white)
                        .font(.system(size: 20 , weight: .bold))
                        .cornerRadius(10)
                })
                
                Spacer()
            }
                
        }
    }
}

#Preview {
    ContentView()
}

struct DayWeather: View {
    
    let dayName: String
    let imageName: String
    let degreesTemperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayName)
                .font(.system(size: 23))
                .foregroundStyle(.white)
            
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                
            
            
            Text("\(degreesTemperature)°")
                .font(.system(size: 23))
                .foregroundStyle(.white)
        }

    }
}
