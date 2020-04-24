//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 667)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let greenView = setupSuperView()
        let redView = setupSubView(superView: greenView)
        
//        greenView.frame.origin = CGPoint(x: 200, y: 200)
//        greenView.bounds.origin = CGPoint(x: 100, y: 100)
        
        print("--greenView--")
        print(greenView.frame)
        print(greenView.bounds)
        print()
        print("--redView--")
        print(redView.frame)
        print(redView.bounds)
    }
    
    func setupSuperView() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    
    func setupSubView(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
    
}
// Present the view controller in the Live View window
let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 375, height: 667)
PlaygroundPage.current.liveView = vc
