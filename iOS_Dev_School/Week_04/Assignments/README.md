## Assignments for Week 04 Day 5 ##

### Date: 2020.05.01 ###

#### Exam 01 ####

- 주문 버튼 터치 시 각 아이템에 대한 수량 증가
- 각 아이템별 주문 수량 증가에 따른 결제금액 증가
- 결제 진행 시 소지금액에서 결제금액만큼 차감 및 주문수량 초기화 
- 소지금액이 결제금액보다 적은 경우 결제 불가 메시지 Alert 띄우기 
- 초기화 버튼은 주문수량, 결제금액, 소지금액을 모두 초기화 
- 초기화 버튼 이외에 한 번 올린 주문수량을 내리는 기능은 없음

```Swift
import UIKit

class ViewController: UIViewController {
    
    var moneyOwned: Int = 70000
    var totalPayment: Int = 0 {
        didSet {
            totalPaymentLabel.text = String(totalPayment)
        }
    }
    var quantityOfJjajang: Int = 0 {
        didSet {
            quantityOfJjajangLabel.text = String(quantityOfJjajang)
        }
    }
    var quantityOfJjambbong: Int = 0 {
        didSet {
            quantityOfJjambbongLabel.text = String(quantityOfJjambbong)
        }
    }
    var quantityOfTangsuyuck: Int = 0 {
        didSet {
            quantityOfTangsuyuckLabel.text = String(quantityOfTangsuyuck)
        }
    }
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceOfJjajangLabel: UILabel!
    @IBOutlet weak var priceOfJjambbongLabel: UILabel!
    @IBOutlet weak var priceOfTangsuyuckLabel: UILabel!
    @IBOutlet weak var jjajangLabel: UILabel!
    @IBOutlet weak var jjambbongLabel: UILabel!
    @IBOutlet weak var tangsuyuckLabel: UILabel!
    @IBOutlet weak var quantityOfJjajangLabel: UILabel!
    @IBOutlet weak var quantityOfJjambbongLabel: UILabel!
    @IBOutlet weak var quantityOfTangsuyuckLabel: UILabel!
    
    let moneyOwnedLabel = UILabel()
    let totalPaymentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseUI()
    }
    
    func labelCommonAttributes (label: UILabel, text: String, origin: CGPoint) {
        label.text = text
        label.frame.origin = origin
        label.frame.size = CGSize(width: 85, height: 45)
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        view.addSubview(label)
    }
    
    func btnCommonAttributes (button: UIButton, title: String, origin: CGPoint) {
        button.frame.origin = origin
        button.setTitle(title, for: .normal)
        button.frame.size = CGSize(width: 85, height: 45)
        button.backgroundColor = .systemOrange
        view.addSubview(button)
    }
    
    func baseUI() {
        let moneyOwnedTitleLabel = UILabel()
        labelCommonAttributes(label: moneyOwnedTitleLabel, text: "소지금", origin: CGPoint(x: view.frame.midX - 185, y: view.frame.midY - 100))
        
        let totalPaymentTitleLabel = UILabel()
        labelCommonAttributes(label: totalPaymentTitleLabel, text: "결제금액", origin: CGPoint(x: view.frame.midX - 185, y: view.frame.midY - 35))
        
        // moneyOwnedLabel
        labelCommonAttributes(label: moneyOwnedLabel, text: String(moneyOwned), origin: CGPoint(x: view.frame.midX - 80, y: view.frame.midY - 100))
        
        // totalPaymentLabel
        labelCommonAttributes(label: totalPaymentLabel, text: String(totalPayment), origin: CGPoint(x: view.frame.midX - 80, y: view.frame.midY - 35))
        
        let moneyOwnedResetButton = UIButton()
        btnCommonAttributes(button: moneyOwnedResetButton, title: "초기화", origin: CGPoint(x: view.frame.maxX - 105, y: view.frame.midY - 100))
        moneyOwnedResetButton.addTarget(self, action: #selector(moneyOwnedResetButtonFunction), for: .touchUpInside)
        
        let payButton = UIButton()
        btnCommonAttributes(button: payButton, title: "결제", origin: CGPoint(x: view.frame.maxX - 105, y: view.frame.midY - 35))
        payButton.addTarget(self, action: #selector(payButtonFunction), for: .touchUpInside)
    }
    
    @IBAction func jjajangOrder(_ sender: UIButton) {
        quantityOfJjajang += 1
        totalPayment += 5000
    }
    @IBAction func jjambbongOrder(_ sender: UIButton) {
        quantityOfJjambbong += 1
        totalPayment += 6000
    }
    @IBAction func tangsuyuckOrder(_ sender: UIButton) {
        quantityOfTangsuyuck += 1
        totalPayment += 12000
    }
    
    @objc func moneyOwnedResetButtonFunction () {
        totalPayment = 0
        moneyOwned = 70000
        moneyOwnedLabel.text = String(moneyOwned)
        
        self.quantityOfJjajang = 0
        self.quantityOfJjambbong = 0
        self.quantityOfTangsuyuck = 0
    }
    
    @objc func payButtonFunction () {
        guard totalPayment < moneyOwned else {
            let alertController = UIAlertController(title: "경고", message: "소지금액이 부족합니다.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true)
            return
        }
        let alertController = UIAlertController(title: "정말 결제하시겠습니까?", message: "총 결제금액은 \(totalPayment)원 입니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
            self.moneyOwned -= self.totalPayment
            self.moneyOwnedLabel.text = String(self.moneyOwned)
            self.totalPayment = 0
            
            self.quantityOfJjajang = 0
            self.quantityOfJjambbong = 0
            self.quantityOfTangsuyuck = 0
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

```



## Assignments for Week 04 Day 1 ##

### Date: 2020.04.27 ###

#### Assignment 01 ####

 [ 과제 ]
 1. ViewController 데이터 전달
   > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
   > A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
   > B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가
     e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8

##### ViewController ####
```Swift
import UIKit

var counter = 1
var labelA = UILabel()

class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var btnToB = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.presentationController?.delegate = self
        
        labelA.text = String(counter)
        labelA.font = UIFont.systemFont(ofSize: 80)
        labelA.frame = CGRect(x: 180, y: 200, width: 50, height: 50)
        labelA.sizeToFit()
        labelA.textAlignment = .center
        labelA.center = view.center
        view.addSubview(labelA)
        
        btnToB.setTitle("Go to Screen B", for: .normal)
        btnToB.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btnToB.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY + 150, width: 50, height: 50)
        btnToB.sizeToFit()
        view.addSubview(btnToB)
        btnToB.addTarget(self, action: #selector(goToScreenB(_:)), for: .touchUpInside)
    }
    
    @objc func goToScreenB (_ sender: UIButton) {
        counter += 3
        let nextVC = BViewController()
        labelA.text = String(counter)
        labelA.sizeToFit()
        labelB.sizeToFit()
        labelB.center = view.center
        
        present(nextVC, animated: true)
    }
```

BViewController
```Swift
import UIKit

var labelB = UILabel()

class BViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    
    var btnToA = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        labelB.text = String(counter)
        labelB.font = UIFont.systemFont(ofSize: 80)
        labelB.frame = CGRect(x: 180, y: 200, width: 50, height: 50)
        labelB.sizeToFit()
        labelB.textAlignment = .center
        labelB.center = view.center
        view.addSubview(labelB)
        
        btnToA.setTitle("Go to Screen A", for: .normal)
        btnToA.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btnToA.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY + 150, width: 50, height: 50)
        btnToA.sizeToFit()
        view.addSubview(btnToA)
        btnToA.addTarget(self, action: #selector(goToScreenA(_:)) , for: .touchUpInside)
    }
    
    @objc func goToScreenA(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        counter += 1
        labelA.text = String(counter)
        labelA.sizeToFit()
        labelA.center = view.center
    }

}
```
