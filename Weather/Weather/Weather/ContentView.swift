//
//  ContentView.swift
//  Weather
//
//  Created by Monika Šličiūtė on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            // background gradient
            BackgroundView(isNight: $isNight)
            
            // UI elements
            VStack {
                // city name
                CityTextView(cityName: "Cupertino, CA")
                
                // weather symbol and temperature
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)

                // week view
                HStack(spacing: 25) {
                    // individual days
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.rain.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                
                Spacer() // takes up entire space
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",                textColor: .blue,                        backgroundColor: .white)
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

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            // day of the week
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            // weather image
            Image(systemName: imageName)
                .renderingMode(.original) // original multicolour
                .resizable() // enable resizing
                .aspectRatio(contentMode: .fit) // fit image in frame
                .frame(width: 40, height: 40) // frame restraints
            // temperature
            Text("\(temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        
        let topColor: Color = isNight ? .black : .blue
        let bottomColor: Color = isNight ? .gray : Color("lightBlue")
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading, // top left
                       endPoint: .bottomTrailing) // bottom right
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default)) // system font customisations
            .foregroundColor(.white) // text colour
            .padding() // default padding
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            // weather image
            Image(systemName: imageName)
                .renderingMode(.original) // original multicolour
                .resizable() // enable resizing
                .aspectRatio(contentMode: .fit) // fit image in frame
                .frame(width: 180, height: 180) // frame restraints
            
            // temperature
            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

