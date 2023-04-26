//
//  ScaledImage.swift
//  EstrellaProject
//
//  Created by Olha Dzhyhirei on 4/18/23.
//

import SwiftUI

struct ScaledImage: View {
    var active: Bool
    let name: String
    let size: CGSize = .init(width: 45, height: 45)
    
    var body: Image {
        let uiImage = resizedImage(named: self.name, for: self.size, shouldDrawCircle: active) ?? UIImage()
        
        return Image(uiImage: uiImage.withRenderingMode(.alwaysOriginal))
    }
    
    func resizedImage(named: String, for size: CGSize, shouldDrawCircle: Bool) -> UIImage? {
        guard let image = UIImage(named: named) else {
            return nil
        }
        
        let renderer = UIGraphicsImageRenderer(size: .init(width: 62, height: 62))
        let renderedImage = renderer.image { context in
            
            let circleDiametr = size.width + 12
            let center = (circleDiametr - size.width) / 2
            let circleSize = CGSize(width: circleDiametr, height: circleDiametr)
            let circleRect = CGRect(origin: .zero, size: circleSize)
            
            if shouldDrawCircle {
                let circlePath = UIBezierPath(ovalIn: circleRect)
                UIColor.black.setFill()
                circlePath.fill()
            }
            
            let imageRect = CGRect(origin: .init(x: center, y: center), size: size)
            image.draw(in: imageRect, blendMode: .normal, alpha: 1.0)
        }
        
        return renderedImage
    }
}
