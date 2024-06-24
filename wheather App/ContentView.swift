//
//  ContentView.swift
//  wheather App
//
//  Created by Nazmin Parween on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    // to update the state of UI
    @State private var isNight = false
    
    var body: some View {
        //ZStack can hold maximum 10 child. {}- view binding.you cannot write whole code inside view binding only if else statement will be able to write
        ZStack{
            //Binding View
          BackgroundView(isNight: isNight)

            VStack{
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
                HStack(spacing: 20){
                WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
                }
                    Spacer()
                Button{
                    isNight.toggle()
                    
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColour: .white)
                }
                Spacer()
              
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView : View {
    var dayOfWeek : String
    var imageName: String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct CityTextView : View {
    var cityName : String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.bottom)
    }
}

struct MainWeatherStatusView: View {
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack(spacing:10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180, height: 180)
            //option+shift+8 for degree symbol
            Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct BackgroundView : View {
    var isNight : Bool
    var body: some View {
        //default dradient provided by Apple
       ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct WeatherButton : View {
    var title : String
    var textColor : Color
    var backgroundColour : Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColour.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
