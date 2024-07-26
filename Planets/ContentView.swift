//
//  ContentView.swift
//  Planets
//
//  Created by Erkebulan Massainov on 26.07.2024.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

#Preview {
    ContentView()
}


struct Home: View {
    @State var models = [
        Model(id: 0, name: "Earth", modelName: "earth.usdz", details: "Earth is the third planet from the Sun, distinguished by its diverse ecosystems and abundant water. It supports a vast array of life forms, from microscopic organisms to complex multicellular organisms. Its atmosphere contains a balanced mix of nitrogen and oxygen, essential for life. The planet's surface is dynamic, featuring mountains, oceans, and plains, shaped by geological activity and climatic processes."),
        Model(id: 1, name: "Glass", modelName: "glass.usdz", details: "Glass is a versatile, transparent material made primarily from silica (sand) and other chemical additives. It is used in a wide range of applications, including windows, bottles, and optical devices. Glass can be molded into various shapes and is prized for its durability, recyclability, and aesthetic qualities. Its ability to transmit light without significant distortion makes it crucial in architecture and technology."),
        Model(id: 2, name: "Green", modelName: "green.usdz", details: "A 'green planet' often refers to Earth or a hypothetical world abundant with plant life and sustainable ecosystems. It emphasizes the importance of maintaining biodiversity and ecological balance. Such a planet would feature extensive forests, clean air, and water, promoting a healthy environment. The concept encourages efforts towards conservation, renewable energy, and environmental protection to ensure a thriving, sustainable future."),
        Model(id: 3, name: "Lava", modelName: "lava.usdz", details: "Lava is molten rock expelled during a volcanic eruption, flowing from a volcano's vent or fissure. It can reach temperatures of over 1,200 degrees Celsius (2,200 degrees Fahrenheit). When lava cools and solidifies, it forms igneous rock. Lava flows can destroy everything in their path but also create new landforms and enrich the soil with minerals, supporting new plant growth over time."),
//        Model(id: 4, name: "Venus", modelName: "Venus.usdz", details: "Venus is the second planet from the Sun and is similar in size and composition to Earth. However, it has a thick, toxic atmosphere composed mainly of carbon dioxide, with clouds of sulfuric acid, making it inhospitable to life as we know it. Surface temperatures can reach up to 475 degrees Celsius (900 degrees Fahrenheit). Venus exhibits a runaway greenhouse effect, providing insights into climate change and planetary atmospheres.")
    ]

    @State var index = 0
    
    var body: some View {
        SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        ZStack{
            HStack{
                Button(action: {
                    withAnimation{
                        if index > 0 {
                            index -= 1
                        }
                    }
                } , label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30, weight: .bold))
                        .opacity(index == 0 ? 0.3 : 1)
                })
                .disabled(index == 0 ? true : false)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    withAnimation{
                        if index < models.count {
                            index += 1
                        }
                    }
                } , label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 30, weight: .bold))
                        .opacity(index == models.count - 1 ? 0.3 : 1)
                })
                .disabled(index == models.count - 1 ? true : false)
            }
            
            Text(models[index].name)
                .font(.system(size: 45, weight: .bold))
        }
        .foregroundColor(.black)
        .padding(.horizontal)
        .padding(.vertical,30)
        
        VStack(alignment: .leading, spacing: 15){
            Text("About")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(models[index].details)
        }
        .padding(.horizontal)
        
        Spacer(minLength: 0)
    }
}



struct Model: Identifiable {
    
    var id: Int
    var name: String
    var modelName: String
    var details: String
}



