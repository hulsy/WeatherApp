//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alex Hulford on 2023-10-03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Ottawa, ON", fontColour: .white)
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: "24")
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", weatherType: "cloud.sun.fill", temp: "22°")
                    WeatherDayView(dayOfWeek: "WED", weatherType: "sun.max.fill", temp: "25°")
                    WeatherDayView(dayOfWeek: "THU", weatherType: "cloud.fill", temp: "17°")
                    WeatherDayView(dayOfWeek: "FRI", weatherType: "cloud.sun.fill", temp: "18°")
                    WeatherDayView(dayOfWeek: "SAT", weatherType: "cloud.fill", temp: "13°")
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                }
                Spacer()
               
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weatherType: String
    var temp: String
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                .fontWeight(.medium)
                .foregroundColor(.white)
            Image(systemName: weatherType)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(temp)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .blue : .black,
                                                   isNight ? Color("lightBlue") : .gray]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var fontColour: Color
    
    var body: some View {
        Text(cityName)
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .fontWeight(.semibold)
            .foregroundColor(fontColour)
            .padding(.top)
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temp: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.bottom, 50)
        }
    }
}
