//
//  ContentView.swift
//  MemoryGame
//
//  Created by Javier Heisecke on 2022-02-03.
//

import SwiftUI

struct MemoryGameView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: MemoryGameViewModel
    @State private var dealt = Set<Int>()
    // a token which provides a namespace for the id's used in matchGeometryEffect
    @Namespace private var dealingNamespace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if viewModel.allCardsMatched {
                confetti
            } else {
                VStack {
                        navigationBar
                        memoryGame
                        bottomBar
                }
                deckBody
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) /// Creates custom back button to restart game when view is dismissed
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    viewModel.restart()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .padding()
    }
    
    var navigationBar: some View {
        HStack {
            Text(viewModel.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .layoutPriority(1)
            HStack {
                Spacer()
                Text("Score")
                Text(viewModel.score)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
    
    private func deal(_ card: Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: Card) -> Animation {
        var delay =  0.0
        if let index = viewModel.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (CardConstants.totalDealDuration / Double(viewModel.cards.count))
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: Card) -> Double {
        -Double(viewModel.cards.firstIndex{ $0.id == card.id} ?? 0)
    }
    
    var memoryGame: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: CardConstants.aspectRatio) { card in
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            } else {
                CardView(card: card, color: viewModel.color)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .zIndex(zIndex(of: card))
                    .transition(.asymmetric(insertion: .identity, removal: .scale))
                    .padding(4)
                    .onTapGesture {
                        withAnimation {
                            viewModel.choose(card)
                        }
                    }
            }
        }
        .font(.largeTitle)
        .padding(.horizontal)
        .onTapGesture { }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(viewModel.cards.filter(isUndealt)) { card in
                CardView(card: card, color: viewModel.color)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .zIndex(zIndex(of: card))
                    .transition(.asymmetric(insertion: .scale, removal: .identity))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(Color(hex: viewModel.color))
        .onTapGesture {
            viewModel.cards.forEach { card in
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    var bottomBar: some View {
        HStack {
            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffle()
                }
            }
            Spacer()
            Button("Restart") {
                withAnimation {
                    dealt = []
                    viewModel.restart()
                }
            }
        }.padding(.horizontal)
    }
    
    var confetti: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier(delay: 0.5))
                .offset(x: -100, y : -50)
            Circle()
                .fill(Color.purple)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier(delay: 0.9))
                .offset(x: -50, y : 0)
            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                HStack {
                    Text("Score")
                        .font(.title3)
                    Text(viewModel.score)
                        .foregroundColor(.red)
                        .font(.title3)
                }
            }
            Circle()
                .fill(Color.red)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier(delay: 1.3))
                .offset(x: 60, y : 70)
            Circle()
                .fill(Color.green)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: 30, y : 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGameViewModel(theme: DeckThemes.randomOption)
        return MemoryGameView(viewModel: game)
            .previewDevice("iPhone 13 Pro Max")
    }
}
