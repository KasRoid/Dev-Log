  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() { // playground 에서는 loadview 에서 먼저 뷰를 넣어주고 시작한다.
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 375, height: 667)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let greenView = setupSuperview()
        let redView = setupSubview(superView: greenView)
        
//        greenView.frame.origin = CGPoint(x: 0, y: 0)
        greenView.bounds.origin = CGPoint(x: 100, y: 100)
        
        print("--greenView--")
        print(greenView.frame)
        print(greenView.bounds)
        print()
        print("--redView--")
        print(redView.frame)
        print(redView.bounds)
    }
    
    func setupSuperview() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        greenView .backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    
    func setupSubview(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
}
  
PlaygroundPage.current.liveView = MyViewController()
