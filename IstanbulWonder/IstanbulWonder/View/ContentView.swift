//
//  ContentView.swift
//  IstanbulWonder
//
//  Created by Mac on 6.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    
  @State  var cardViews: [CardView] = {
        
        var views = [CardView]()
        for index in 0..<2 {
            
            views.append(CardView(istanbul: IstanbulData[index]))
        }
        
        return views
    }()
    
    private func moveCards() {
        
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let istanbul = IstanbulData[lastCardIndex % IstanbulData.count]
        
        let newCardView = CardView(istanbul: istanbul)
        
        cardViews.append(newCardView)
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    enum DragState {
        
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing:
                return false
            case .dragging(let translation):
                return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing:
                return true
            case .dragging(let translation):
                return true
            }
        }
    }
    
    var body: some View {
        VStack {
            
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo).opacity(dragState.isDragging ? 0.0 : 1.0).animation(.default)
            Spacer()
            ZStack {
                
                ForEach(cardViews) { CardView in
                    
                    CardView
                        .zIndex(self.isTopCard(cardView: CardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 128))
                                    .shadow(color: .black, radius: 12, x: 0, y: 0)
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: CardView) ? 1.0 : 00)
                                
                                Image(systemName: "heart.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 128))
                                    .shadow(color: .black, radius: 12, x: 0, y: 0)
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: CardView) ? 1.0 : 00)
                            }
                        )
                        .offset(x:
                                    self.isTopCard(cardView: CardView) ?
                                self.dragState.translation.width : 0, y:
                                    self.isTopCard(cardView: CardView) ?
                                self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging  && isTopCard(cardView: CardView) ? 0.65 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: CardView) ? Double(self.dragState.translation.width / 12): 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag): state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else { return
                                        
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        self.moveCards()
                                    }
                                })
                        )
                        
                }
            }
            .padding()
            Spacer()
            
            FooterView(showBookingAlert: $showAlert).opacity(dragState.isDragging ? 0.0 : 1.0).animation(.default)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Başarılı"), message: Text("Güzel anılar biriktireceğiniz bir gezi olması dileğiyle"), dismissButton: .default(Text("Mutlu Geziler")))
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
