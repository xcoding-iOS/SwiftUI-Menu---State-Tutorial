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
        VStack {
            HStack {
                Text("Menu")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                Spacer()
                
                Button("Resetta", action: {
                    self.pizze = 0
                    self.cokes = 0
                })
            }
            
            Stepper(value: $pizze, in: 0...10, label: {
                Text("Pizza Margherita")
                Text("\(pizze)")
            })
            
            Stepper(value: $cokes, in: 0...10, label: {
                Text("Coca Cola")
                Text("\(cokes)")
            })
            
            HStack {
                Text("Prezzo finale")
                Spacer()
                Text("\(format(x: finalPrice))")
            }
            
            if (finalPrice > 0) {
                Text("Indirizzo di spedizione")
                TextField("Via...", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Toggle(isOn: $premiumDelivery, label: {
                    Text("Spedizione Prioritaria")
                })
                
            }
            
        }
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
