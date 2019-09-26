//
//  ContentView.swift
//  SwiftUI-State
//
//  Created by Giuseppe Sapienza on 20/09/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pizze: Int = 0
    @State var cokes: Int = 0
    @State var address: String = ""
    @State var premiumDelivery: Bool = false
    
    let pizzaPrice: Double = 11.50
    let cokePrice: Double = 2.50
    let premiumDeliveryPrice: Double = 8.0
    
    var finalPrice: Double {
        (Double(pizze) * pizzaPrice)
        +
        (Double(cokes) * cokePrice)
        +
        (premiumDelivery ? Double(premiumDeliveryPrice) : 0)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Menu")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Spacer()
                
                Button("Resetta", action: {
                    self.pizze = 0
                    self.cokes = 0
                    self.address = ""
                    self.premiumDelivery = false
                })
            }
            
            Stepper(value: $pizze, in: 0...10, label: {
                VStack(alignment: .leading) {
                   Text("Pizza Margherita")
                        .fontWeight(.bold)
                    Text("\(format(x: pizzaPrice)) €")
                        .font(.callout)
                }
                Spacer()
                Text("\(pizze)")
            })
            
            Stepper(value: $cokes, in: 0...10, label: {
                VStack(alignment: .leading) {
                   Text("Coca Cola")
                        .fontWeight(.bold)
                    Text("\(format(x: cokePrice)) €")
                        .font(.callout)
                }
                Spacer()
                Text("\(cokes)")
            })
            .padding(.bottom, 20)
            
            HStack(alignment: .bottom) {
                Text("Totale")
                    .font(.title)
                Spacer()
                Text("\(format(x: finalPrice)) €")
                    .font(.title)
            }
            .padding(.bottom, 20)
            
            if (finalPrice > 0) {
                VStack(alignment: .leading) {
                    Text("Indirizzo di spedizione")
                    TextField("Via...", text: $address)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Toggle(isOn: $premiumDelivery, label: {
                        Text("Priority")
                    })
                }
                .padding(.bottom, 20)
                
                if (address.count > 10) {
                    Text("Consegneremo a ")
                    +
                    Text(address)
                        .fontWeight(.bold)
                    +
                    Text(" e pagherai un totale di ")
                    +
                    Text("\(format(x: finalPrice)) €")
                        .fontWeight(.bold)
                }
                
            }
            
            Spacer()
            
        }
        .padding()
    }
    
    func format(x: Double) -> String {
        String(format: "%.2f", x)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
