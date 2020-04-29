
import UIKit
import PlaygroundSupport

final class MyViewController: UIViewController {
  
  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSwitch()
    setupSegmentedControl()
  }
  
  func setupCommonAttributes(for label: UILabel, title: String, frame: CGRect) {
    label.text = title
    label.frame = frame
    label.textColor = .white
    label.textAlignment = .center
    label.backgroundColor = .darkGray
    view.addSubview(label)
  }
  
  /*
   UISwitch
   : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
   */
  
  let switchLabel = UILabel()
  
  func setupSwitch() {
    let onOffSwitch = UISwitch()
    onOffSwitch.frame.origin = CGPoint(x: 165, y: 180)
    onOffSwitch.addTarget(self, action: #selector(toggleOnOffText), for: .valueChanged)
    view.addSubview(onOffSwitch)
    
    let frame = CGRect(x: 140, y: 212, width: 100, height: 30)
    setupCommonAttributes(for: switchLabel, title: "Off", frame: frame)
  }
  
  @objc func toggleOnOffText(_ sender: UISwitch) {
    switchLabel.text = sender.isOn ? "On" : "Off"
  }
  
  
  /***************************************************
   UISegmentedControl
   : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
   ***************************************************/
  
  let selectedSegmentedLabel = UILabel()
  
  func setupSegmentedControl() {
    let segmentedControl = UISegmentedControl(items: ["Dog", "Cat", "Bird"])
    segmentedControl.frame = CGRect(x: 115, y: 290, width: 150, height: 30)
    segmentedControl.addTarget(self, action: #selector(showSelectedTitle(_:)), for: .valueChanged)
    view.addSubview(segmentedControl)
    
    let frame = CGRect(x: 140, y: 322, width: 100, height: 30)
    setupCommonAttributes(for: selectedSegmentedLabel, title: "None", frame: frame)
  }
  
  @objc func showSelectedTitle(_ sender: UISegmentedControl) {
    let index = sender.selectedSegmentIndex
    let title = sender.titleForSegment(at: index)
    selectedSegmentedLabel.text = title
  }
}

PlaygroundPage.current.liveView = MyViewController()

