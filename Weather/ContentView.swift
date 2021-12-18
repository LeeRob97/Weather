//
//  ContentView.swift
//  Weather
//
//  Created by Lee Robertson on 12/16/21.
//

import SwiftUI

struct BackgroundView: View {
    var isNight: Bool

    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    (isNight) ? .black : .blue,
                    (isNight) ? .gray : Color("lightBlue")
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .textCase(.uppercase)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct ContentView: View {
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                CurrentWeatherView(
                    imageName: (isNight) ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 50
                )
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "tue",
                                   imageName: "cloud.sun.fill",
                                   temperature: 50)
                    WeatherDayView(dayOfWeek: "wed",
                                   imageName: "sun.max.fill",
                                   temperature: 75)
                    WeatherDayView(dayOfWeek: "thur",
                                   imageName: "wind.snow",
                                   temperature: 10)
                    WeatherDayView(dayOfWeek: "fri",
                                   imageName: "sunset.fill",
                                   temperature: 50)
                    WeatherDayView(dayOfWeek: "sat",
                                   imageName: "snow",
                                   temperature: -10)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
