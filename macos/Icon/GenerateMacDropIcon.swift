// Erzeugt das macOS-App-Icon (AppIcon-macOS-1024.png) aus DropIcon-1024.png:
// Motiv in eine abgerundete "Squircle"-Kachel nach macOS-Raster (824 px auf 1024 px) mit weichem Schatten.
// Aufruf: swiftc GenerateMacDropIcon.swift -o GenerateMacDropIcon && ./GenerateMacDropIcon
import AppKit

let dir = URL(fileURLWithPath: CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : ".")
guard let source = NSImage(contentsOf: dir.appendingPathComponent("DropIcon-1024.png")),
      let cgSource = source.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    fatalError("DropIcon-1024.png nicht gefunden")
}

let size = 1024
let ctx = CGContext(data: nil, width: size, height: size, bitsPerComponent: 8, bytesPerRow: 0,
                    space: CGColorSpace(name: CGColorSpace.sRGB)!,
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

let tile = CGRect(x: 100, y: 100, width: 824, height: 824)
let path = CGPath(roundedRect: tile, cornerWidth: 185, cornerHeight: 185, transform: nil)

// Schatten
ctx.saveGState()
ctx.setShadow(offset: CGSize(width: 0, height: -10), blur: 28, color: CGColor(gray: 0, alpha: 0.28))
ctx.addPath(path)
ctx.setFillColor(CGColor(srgbRed: 0xF6 / 255, green: 0xEE / 255, blue: 0xDD / 255, alpha: 1))
ctx.fillPath()
ctx.restoreGState()

// Motiv
ctx.saveGState()
ctx.addPath(path)
ctx.clip()
ctx.interpolationQuality = .high
ctx.draw(cgSource, in: tile)
ctx.restoreGState()

// Feine Kante
ctx.addPath(path)
ctx.setStrokeColor(CGColor(gray: 0, alpha: 0.08))
ctx.setLineWidth(2)
ctx.strokePath()

let out = dir.appendingPathComponent("AppIcon-macOS-1024.png")
let rep = NSBitmapImageRep(cgImage: ctx.makeImage()!)
try! rep.representation(using: .png, properties: [:])!.write(to: out)
print("Geschrieben: \(out.path)")
