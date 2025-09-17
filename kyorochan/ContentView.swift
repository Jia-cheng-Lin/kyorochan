//
//  ContentView.swift
//  kyorochan
//
//  Created by 林嘉誠 on 2025/9/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(
                    gradient: Gradient(colors: [
                    Color.white.opacity(0.6),
                    Color.blue.opacity(0.4)
                ]),
                center:.init(x: 0.5, y: 0.7),
                startRadius: 40,
                endRadius: 350
                    )
                .edgesIgnoringSafeArea(.all)//把上面的匡填滿
                .opacity(0.6) // 若想加淡灰遮罩可調高數值
            
            // 將示意圖縮小為合適尺寸，避免鋪滿整個畫面
//            Image("kyorochan")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 500) // 調整為你需要的尺寸（例如 220、280、320）
//                .opacity(0.4)      // 讓上層內容更清楚；若不需要可改為 1.0
//                .allowsHitTesting(false) // 避免影響上層互動
//                .offset(x: 0, y: 60)

            //頭部
            Capsule()
                .trim(from:0.5, to:1)
                .fill(Color(red: 232/255, green:34/255, blue:34/255).opacity(0.6))
                .overlay(
                    Capsule()
                        .trim(from:0.5, to:1)
                        .stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 260, height: 380)
                .offset(x: 20, y: 20)

            //身體
            Capsule()
                .trim(from:0, to:0.5)
                .fill(Color(red: 126/255, green:73/255, blue:50/255).opacity(0.6))
                .overlay(
                    Capsule()
                        .trim(from:0, to:0.5)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(color: Color.black.opacity(0.8), radius: 12, x: 4, y: 8) // 新增陰影
                .frame(width: 260, height: 430)
                .offset(x: 20, y: 20)
            
            //身體線條（建議用 frame 控制大小與位置）
            BodyLine()
                .fill(Color(red: 243/255, green:219/255, blue:50/255).opacity(0.5))
                .overlay(
                    BodyLine().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 490, height: 700) // 與正規化基準一致或等比
                .offset(x: 0, y: 160)           // 用容器的 offset 來定位
                

            //左腳（已正規化）
            LeftFoot()
                .fill(Color(red: 67/255, green:41/255, blue:27/255).opacity(0.5))
                .overlay(
                    LeftFoot().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 490, height: 700) // 與 BodyLine 相同基準以保持相對位置
                .offset(x: 0, y: 151)
                .shadow(color: Color.black.opacity(0.6), radius: 12, x: 4, y: 8) // 新增陰影
//            
            //右腳（已正規化）
            RightFoot()
                .fill(Color(red: 67/255, green:41/255, blue:27/255).opacity(0.5))
                .overlay(
                    RightFoot().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 490, height: 700) // 與 BodyLine 相同基準以保持相對位置
                .offset(x: 0, y: 151)
                .shadow(color: Color.black.opacity(0.6), radius: 12, x: 4, y: 8) // 新增陰影
            
                
            //嘴巴（舊）加邊框
//            Ellipse()
//              .fill(Color(red: 253/255, green: 187/255, blue: 72/255).opacity(0.6))
//              .overlay(
//                  Ellipse().stroke(Color.black, lineWidth: 2)
//              )
//              .frame(width: 230, height: 120)
//              .rotationEffect(.degrees(-15))
//              .offset(x: -70, y: 20)
//            
          //嘴巴（新）
            PointedOval(sharpness: 0.75)
              .fill(Color(red: 253/255, green: 187/255, blue: 72/255).opacity(0.6))
              .overlay(PointedOval(sharpness: 0.75).stroke(.black, lineWidth: 2))
              .frame(width: 230, height: 120)
              .rotationEffect(.degrees(-15))
              .offset(x: -70, y: 20)
              .shadow(color: Color.black.opacity(0.6), radius: 12, x: 4, y: 8) // 新增陰影
            
            //左眼睛（白）加邊框
            Circle()
                .fill(Color.white.opacity(0.6))
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 84)
                .offset(x: -48, y: -83)
            
            //左眼睛（黑）加邊框
            Circle()
                .fill(Color.black.opacity(0.6))
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 60)
                .offset(x: -38, y: -83)
            
            //右眼睛（白）加邊框
            Circle()
                .fill(Color.white.opacity(0.6))
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 110)
                .offset(x: 52, y: -75)
            
            //右眼睛（黑）加邊框
            Circle()
                .fill(Color.black.opacity(0.6))
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 2)
                )
                .frame(width: 80)
                .offset(x: 40, y: -75)
            
            //身體加陰影
            BodyShadow()
                .fill(.black.opacity(0.3))
//                .overlay(
//                    BodyShadow().stroke(Color.black, lineWidth: 2)
//                )
                .frame(width: 490, height: 700) // 與 BodyLine 相同基準以保持相對位置
                .offset(x: 0, y: 151)
            
            //嘴巴加陰影
            MouthShadow()
                .fill(.black.opacity(0.3))
//                .overlay(
//                    MouthShadow().stroke(Color.black, lineWidth: 2)
//                )
                .frame(width: 490, height: 700) // 與 BodyLine 相同基準以保持相對位置
                .offset(x: 0, y: 151)

            Text("Do you remember me?")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
                .glassEffect()
                .offset(x: 0, y: -340)
            Text("I'm Kyorochan!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
//                .glassEffect()
                .offset(x: 0, y: -285)
            Text("也有人叫我大嘴鳥")
                .font(.title)
                .foregroundColor(.black)
                .padding()
//                .glassEffect()
                .offset(x: 0, y: -240)
            Text("私はキョロちゃんです")
                .font(.title)
                .foregroundColor(.black)
                .padding()
//                .glassEffect()
                .offset(x: 0, y: -200)
        }
    }
}

#Preview {
    ContentView()
}

// MARK: - 正規化工具（基準尺寸 600x800）
private enum DesignSpace {
    static let width: CGFloat = 600
    static let height: CGFloat = 800
    static func sx(in rect: CGRect) -> CGFloat { rect.width / width }
    static func sy(in rect: CGRect) -> CGFloat { rect.height / height }
    static func p(_ x: CGFloat, _ y: CGFloat, in rect: CGRect) -> CGPoint {
        CGPoint(x: x * sx(in: rect), y: y * sy(in: rect))
    }
}

struct BodyLine: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        // 使用正規化點，確保不會因外部布局改變而跑位
        p.move(to: DesignSpace.p(167, 321, in: rect))
        p.addLine(to: DesignSpace.p(192, 320, in: rect))
        p.addLine(to: DesignSpace.p(205, 377, in: rect))
        p.addLine(to: DesignSpace.p(245, 377, in: rect))
        p.addLine(to: DesignSpace.p(260, 337, in: rect))
        p.addLine(to: DesignSpace.p(281, 337, in: rect))
        p.addLine(to: DesignSpace.p(300, 409, in: rect))
        p.addLine(to: DesignSpace.p(350, 380, in: rect))
        p.addLine(to: DesignSpace.p(350, 313, in: rect))
        p.addLine(to: DesignSpace.p(372, 301, in: rect))
        p.addLine(to: DesignSpace.p(372, 363, in: rect))
        p.addLine(to: DesignSpace.p(457, 324, in: rect))
        p.addLine(to: DesignSpace.p(457, 302, in: rect))
        p.addLine(to: DesignSpace.p(484, 302, in: rect))
        p.addLine(to: DesignSpace.p(484, 236, in: rect))
        p.addLine(to: DesignSpace.p(167, 236, in: rect))
        p.closeSubpath()
        return p
    }
}

struct LeftFoot: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        // 正規化 LeftFoot 的座標
        p.move(to: DesignSpace.p(272, 488, in: rect))
        p.addLine(to: DesignSpace.p(261, 520, in: rect))
        p.addLine(to: DesignSpace.p(176, 516, in: rect))
        p.addLine(to: DesignSpace.p(173, 526, in: rect))
        p.addLine(to: DesignSpace.p(201, 531, in: rect))
        p.addLine(to: DesignSpace.p(240, 525, in: rect))
        p.addLine(to: DesignSpace.p(167, 535, in: rect))
        p.addLine(to: DesignSpace.p(166, 543, in: rect))
        p.addLine(to: DesignSpace.p(192, 545, in: rect))
        p.addLine(to: DesignSpace.p(263, 535, in: rect))
        p.addLine(to: DesignSpace.p(183, 552, in: rect))
        p.addLine(to: DesignSpace.p(182, 563, in: rect))
        p.addLine(to: DesignSpace.p(201, 560, in: rect))
        p.addLine(to: DesignSpace.p(278, 540, in: rect))
        p.addLine(to: DesignSpace.p(301, 542, in: rect))
        p.addLine(to: DesignSpace.p(303, 534, in: rect))
        p.addLine(to: DesignSpace.p(282, 525, in: rect))
        p.addLine(to: DesignSpace.p(286, 490, in: rect))
        p.closeSubpath()
        return p
    }
}

struct RightFoot: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        // 正規化 RightFoot 的座標
        p.move(to: DesignSpace.p(349, 494, in: rect))
        p.addLine(to: DesignSpace.p(355, 531, in: rect))
        p.addLine(to: DesignSpace.p(332, 541, in: rect))
        p.addLine(to: DesignSpace.p(337, 547, in: rect))
        p.addLine(to: DesignSpace.p(360, 547, in: rect))
        p.addLine(to: DesignSpace.p(455, 570, in: rect))
        p.addLine(to: DesignSpace.p(455, 559, in: rect))
        p.addLine(to: DesignSpace.p(401, 547, in: rect))
        p.addLine(to: DesignSpace.p(468, 554, in: rect))
        p.addLine(to: DesignSpace.p(469, 542, in: rect))
        p.addLine(to: DesignSpace.p(454, 541, in: rect))
        p.addLine(to: DesignSpace.p(403, 533, in: rect))
        p.addLine(to: DesignSpace.p(460, 537, in: rect))
        p.addLine(to: DesignSpace.p(466, 531, in: rect))
        p.addLine(to: DesignSpace.p(455, 525, in: rect))
        p.addLine(to: DesignSpace.p(375, 524, in: rect))
        p.addLine(to: DesignSpace.p(366, 491, in: rect))
        p.closeSubpath()
        return p
    }
}


struct PointedOval: Shape {
    // 0...1，越大越尖（建議 0.0 ~ 0.6 之間）
    var sharpness: CGFloat = 0.4

    func path(in rect: CGRect) -> Path {
        var p = Path()
        let w = rect.width
        let h = rect.height

        let left  = CGPoint(x: 0, y: h/2)
        let right = CGPoint(x: w, y: h/2)
        let top   = CGPoint(x: w/2, y: 0)
        let bottom = CGPoint(x: w/2, y: h)

        // 控制點距離中心的比例，sharpness 越大，左右端越尖
        let kx = (w/2) * (1 - sharpness)
        let ky = (h/2) * (1 - sharpness/2)

        // 使用四段三次貝茲，確保平滑閉合
        p.move(to: left)
        // 左 -> 上
        p.addCurve(to: top,
                   control1: CGPoint(x: 0, y: h/2 - ky),
                   control2: CGPoint(x: w/2 - kx, y: 0))
        // 上 -> 右
        p.addCurve(to: right,
                   control1: CGPoint(x: w/2 + kx, y: 0),
                   control2: CGPoint(x: w, y: h/2 - ky))
        // 右 -> 下
        p.addCurve(to: bottom,
                   control1: CGPoint(x: w, y: h/2 + ky),
                   control2: CGPoint(x: w/2 + kx, y: h))
        // 下 -> 左
        p.addCurve(to: left,
                   control1: CGPoint(x: w/2 - kx, y: h),
                   control2: CGPoint(x: 0, y: h/2 + ky))

        p.closeSubpath()
        return p
    }
}



struct BodyShadow: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        // 正規化 RightFoot 的座標
        p.move(to: DesignSpace.p(424, 65, in: rect))
        p.addQuadCurve(to: DesignSpace.p(405, 244, in: rect), control: CGPoint(x: 400, y: 200))
        p.addQuadCurve(to: DesignSpace.p(200, 446, in: rect), control: CGPoint(x: 350, y: 420))
        p.addQuadCurve(to: DesignSpace.p(364, 491, in: rect), control: CGPoint(x: 230, y: 450))
        p.addQuadCurve(to: DesignSpace.p(478, 350, in: rect), control: CGPoint(x: 405, y: 390))
        p.addQuadCurve(to: DesignSpace.p(483, 235, in: rect), control: CGPoint(x: 400, y: 235))
        p.addQuadCurve(to: DesignSpace.p(424, 65, in: rect), control: CGPoint(x: 395, y: 80))

        
        p.closeSubpath()
        return p
    }
}

struct MouthShadow: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        // 正規化 RightFoot 的座標
        p.move(to: DesignSpace.p(295, 180, in: rect))
        p.addQuadCurve(to: DesignSpace.p(126, 315, in: rect), control: CGPoint(x: 250, y: 261))
        p.addQuadCurve(to: DesignSpace.p(354, 240, in: rect), control: CGPoint(x: 200, y: 310))
        p.addQuadCurve(to: DesignSpace.p(295, 180, in: rect), control: CGPoint(x: 290, y: 170))
        
        p.closeSubpath()
        return p
    }
}
