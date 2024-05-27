//
//  ContentView.swift
//  KitWithUI
//
//  Created by Hélio Mesquita on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Button("CLOSINGS (24)") {}
                    .tint(.red)
                    .buttonStyle(.borderedProminent)
                Button("ALERTS (24)") {}
                    .tint(.red)
                    .buttonStyle(.borderedProminent)
            }
            Text("SACRAMENTO, CA 94203")
                .foregroundColor(.white)
            HStack {
                Button {} label: {
                    Label("Change", systemImage: "map.fill")
                        .foregroundStyle(.black)
                }
                .tint(.gray)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                
                
                Button {} label: {
                    Image(systemName: "location.north.fill")
                        .foregroundStyle(.black)
                }
                .tint(.gray)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            HStack(spacing: 30) {
                HStack(alignment: .lastTextBaseline) {
                    Text("56°")
                        .montSerratBold(size: 56)
                    Text("F")
                        .montSerratBold(size: 22)
                        .tint(.white)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("56 fahrenheit degrees")

                HStack(alignment: .center) {
                    Image(systemName: "sun.max")
                        .font(.system(size: 40))
                }
            }
            .foregroundColor(.white)
            HStack {
                Text("Feels Like")
                    .montSerratRegular(size: 12)
                Text("53°F")
                    .montSerratBold(size: 16)
                Text("Sunny")
                    .montSerratRegular(size: 12)
                Image(systemName: "drop.fill")
                    .font(.system(size: 16))
                Text("1%")
                    .montSerratBold(size: 12)
            }
            .foregroundColor(.white)
            Button {} label: {
                Image(systemName: "dot.radiowaves.left.and.right")
                    .foregroundStyle(.black)
                    .font(.system(size: 30))
                Text("VIEW INTERACTIVE RADAR")
                    .foregroundStyle(.black)
                    .montSerratRegular(size: 18)
            }
            .buttonStyle(.borderedProminent)
            .tint(.gray)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("By Ben Frechette")
                        .montSerratBold(size: 16)
                        .foregroundColor(.white)
                }
                Text("Mountain snow diminishes Wednesday")
                    .montSerratRegular(size: 26)
                    .foregroundColor(.white)

                Rectangle()
                    .frame(height: 1)
                    .tint(.white)
                HStack {
                    Image(systemName: "playstation.logo")
                        .foregroundStyle(.black)
                        .font(.system(size: 30))
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .foregroundStyle(.black)
                        .font(.system(size: 30))
                }
            }
            .padding()
            .background(
                Color(.gray.withAlphaComponent(0.5))
            )
        }
        .padding()
        .background(
                Image("bg_weather_sunny")
                    .resizable()
            )
    }
}

#Preview {
    ContentView()
}
