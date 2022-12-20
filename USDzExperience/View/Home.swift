//
//  Home.swift
//  USDzExperience
//
//  Created by user on 11/2/22.
//

import SwiftUI
import SceneKit

struct Home: View {
    
    @State var scene: SCNScene? = .init(named: "Shoe.scn")
    // View Properties
    @State var isVerticalLook: Bool = false
    
    @State var isPresentARQuickLook: Bool = false
    
    var body: some View {
        VStack(spacing: 120) {
            HeaderView()
            CustomSceneView(scene: $scene)
                .frame(height: 350)
                .padding(.top, -50)
                .padding(.bottom, -15)
            CustomSeeker()
        }
        .padding()
        .sheet(isPresented: $isPresentARQuickLook) {
            ARQuickLookView()
        }
    }
    
    @ViewBuilder
    func CustomSeeker() -> some View {
        GeometryReader { _ in
            Rectangle()
                .trim(from: 0, to: 0.474)
                .stroke(.linearGradient(
                    colors: [
                        .clear,
                        .clear,
                        .white.opacity(0.2),
                        .white.opacity(0.6),
                        .white,
                        .white.opacity(0.6),
                        .white.opacity(0.2),
                        .clear,
                        .clear
                    ]
                    , startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 1, dash: [3], dashPhase: 1))
                .overlay {
                    
                }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.white.opacity(0.2))
                    }
            }

            Spacer()
            
            Button {
                isPresentARQuickLook = true
            } label: {
                Image(systemName: "camera.aperture")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .rotationEffect(.init(degrees: isVerticalLook ? 0 : 90))
                    .frame(width: 42, height: 42)
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.white.opacity(0.2))
                    }
            }
        }
    }
    
}

struct ARQuickLookView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    func makeUIViewController(context: Context) -> UIViewController {
        return ARQuickLookViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }

}
