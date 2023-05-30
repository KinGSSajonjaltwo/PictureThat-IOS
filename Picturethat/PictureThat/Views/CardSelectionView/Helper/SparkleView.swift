//
//  SparkleView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/30.
//

import SwiftUI
import UIKit

struct Sparkle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat
    var opacity: Double
    var animationDuration: Double
}

struct SparkleView: View {
    @State private var sparkles: [Sparkle] = []
    
    private let maxSparkles = 30 // 최대 sparkle 개수
    private let minSize: CGFloat = 10
    private let maxSize: CGFloat = 20
    private let minDuration: Double = 1
    private let maxDuration: Double = 5
    
    private func getRandomPosition() -> CGPoint {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let x = CGFloat.random(in: 0...screenWidth)
        let y = CGFloat.random(in: 0...screenHeight)
        return CGPoint(x: x, y: y)
    }
    
    private func getRandomSize() -> CGFloat {
        return CGFloat.random(in: minSize...maxSize)
    }
    
    private func getRandomOpacity() -> Double {
        return Double.random(in: 0.7...1)
    }
    
    private func getRandomDuration() -> Double {
        return Double.random(in: minDuration...maxDuration)
    }
    
    private func createSparkle() {
        if sparkles.count < maxSparkles {
            var sparkle = Sparkle(position: getRandomPosition(),
                                  size: getRandomSize(),
                                  opacity: 0,
                                  animationDuration: getRandomDuration())
            sparkles.append(sparkle)
            
            withAnimation(Animation.easeInOut(duration: sparkle.animationDuration)) {
                if let index = sparkles.firstIndex(where: { $0.id == sparkle.id }) {
                    sparkles[index].opacity = getRandomOpacity()
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + sparkle.animationDuration) { [sparkle] in
                withAnimation(Animation.easeInOut(duration: sparkle.animationDuration)) {
                    if let index = sparkles.firstIndex(where: { $0.id == sparkle.id }) {
                        sparkles[index].opacity = 0
                    }
                }
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (2 * sparkle.animationDuration)) { [sparkle] in
                if let index = sparkles.firstIndex(where: { $0.id == sparkle.id }) {
                    sparkles.remove(at: index)
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black // 검정 배경
            
            ForEach(sparkles) { sparkle in
                Image(systemName: "sparkle")
                    .resizable()
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: sparkle.size, height: sparkle.size)
                    .opacity(sparkle.opacity)
                    .position(sparkle.position)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                createSparkle()
            }
        }
    }
}

struct SparkleView_Previews: PreviewProvider {
    static var previews: some View {
        SparkleView()
    }
}
