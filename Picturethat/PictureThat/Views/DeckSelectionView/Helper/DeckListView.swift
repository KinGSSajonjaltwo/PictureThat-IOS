//
//  DeckListView.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/05/05.
//

import SwiftUI

struct DeckListView<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    @Binding var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex = 0
    
    init(index: Binding<Int>, items: Binding<[T]>, spacing: CGFloat = 15, trailingSpace: CGFloat = 100, content: @escaping (T)->Content) {
        
        self._list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
        
    }
    
    
    var body: some View {
        GeometryReader { geo in
            
            
            let deckWidth = geo.size.width - trailingSpace
            let deckHeigth = (geo.size.width - trailingSpace)/3*4
            
            let scrollWidth = deckWidth + spacing
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list){ item in

                    content(item)
                        .frame(width: deckWidth, height: deckHeigth)
                    
                }
            }
            .frame(height: deckHeigth)
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -scrollWidth) + adjustMentWidth + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        
                        out = value.translation.width
                        
                    })
                    .onEnded({ value in
                        
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX/scrollWidth
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        currentIndex = index
                        
                    })
                    .onChanged({ value in
                        
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX/scrollWidth
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        
                    })
            )
            
            
        }
        .animation(Animation.spring(), value: offset == 0)
    }
}

struct DeckListView_Previews: PreviewProvider {
    static var previews: some View {
        DeckSelectionView()
    }
}
