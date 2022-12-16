//
//  ContentView.swift
//  Magic 8 Ball
//
//  Created by Andrew Castillo Nevarez on 12/15/22.
//

import SwiftUI
// Down below is my entire code! It explains on how the image is and how it can rotate once you press the button on the simulation. it also shows all my private variables I been using in this app.
struct ContentView: View {
    @State private var randomAnswer = 0
    @State private var rotation = 0.0
    @State private var question = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.opacity(0.7).ignoresSafeArea()
                VStack {
                    CustomText(text: "Magic 8 Ball")
                    Image("8ball\(randomAnswer)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotation))
                        .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                        .padding(50)
                    HStack {
                        Button("Ask!") {
                            chooseAnswer(times: 3)
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                                rotation += 360
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                    }
                    NavigationLink("How to follow the directions", destination: InstructionsView())
                        .font(Font.custom("Market Felt", size: 24))
                        .padding()
                    TextField("Ask a question", text: $question)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
            }
        }
    }
    // I only used one function in this entire code. This shows what the Magic 8 Ball does once you pressed the button. it changes the answers by saying yes or no for your specific question you asked.
        func chooseAnswer(times: Int) {
            if times > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    randomAnswer = Int.random(in: 1...2)
                    chooseAnswer(times: times - 1)
                }
            }
        }
    // Down Below is all my structures I made. it explains the concept on how I wanted the button and the texts to be like on the simulation.
            struct ContentView_Previews: PreviewProvider {
                static var previews: some View {
                    ContentView()
                }
            }
            struct CustomText: View {
                let text: String
                var body: some View {
                    Text(text).font(Font.custom("Market Felt", size: 36))
                }
            }
            struct CustomButtonStyle: ButtonStyle {
                func makeBody(configuration: Configuration) -> some View {
                    configuration.label
                        .frame(width: 50)
                        .font(Font.custom("Market Felt", size: 24))
                        .padding()
                        .background(.black).opacity(configuration.isPressed ? 0.0 : 1.0)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            struct InstructionsView: View {
                var body: some View {
                    ZStack {
                        Color.gray.opacity(0.7).ignoresSafeArea()
                        VStack (alignment: .leading){
                            Text("This game is very simple, you ask the Magic 8 Ball what your question simply is. Its a pretty good resource to see if the Magic 8 Ball will say yes or no.")
                                .padding()
                            Text("Once you've typed in your question, you can press the button and the Magic 8 Ball will choose its answer for your specific question your asking.")
                                .padding()
                            Text("When the Magic 8 Ball gives your answer out, you can ask it another question to see if the Magic 8 Ball will give you another answer.")
                                .padding()
                        }
                        Spacer()
                    }
                }
            }
        }
// This thing above this comment is the insturctions on how to play this game. It will explain everything what you must do when you click on "How to follow the directions" button.
