import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canvasView = PKCanvasView()
    
    var body: some View {
        Canvas(canvasView: canvasView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Canvas: UIViewRepresentable {
    var canvasView: PKCanvasView
    let picker = PKToolPicker.init()
    
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        self.canvasView.becomeFirstResponder()
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        picker.addObserver(canvasView)
        picker.setVisible(true, forFirstResponder: uiView)
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
        }
    }
}
