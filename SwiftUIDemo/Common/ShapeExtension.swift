//
//  ShapeExtension.swift
//  SwiftUIDemo
//
//  Created by zhang dekai on 2025/2/10.
//

import SwiftUI


// 自定义圆角形状
struct RoundedCorners: Shape {
    var tl: CGFloat = 0 // 左上角圆角
    var tr: CGFloat = 0 // 右上角圆角
    var bl: CGFloat = 0 // 左下角圆角
    var br: CGFloat = 0 // 右下角圆角
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 左上角
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + tl))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY), tangent2End: CGPoint(x: rect.minX + tl, y: rect.minY), radius: tl)
        
        // 上边
        path.addLine(to: CGPoint(x: rect.maxX - tr, y: rect.minY))
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY), tangent2End: CGPoint(x: rect.maxX, y: rect.minY + tr), radius: tr)
        
        // 右上角
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - br))
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY), tangent2End: CGPoint(x: rect.maxX - br, y: rect.maxY), radius: br)
        
        // 右下角
        path.addLine(to: CGPoint(x: rect.minX + bl, y: rect.maxY))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY), tangent2End: CGPoint(x: rect.minX, y: rect.maxY - bl), radius: bl)
        
        // 左下角
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + tl))
        
        path.closeSubpath()
        
        return path
    }
}
