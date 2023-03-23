import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Hello, World!"
        view.addSubview(label)

        
        button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = CGPoint(x: 160, y: 350)
        button.setTitle("Tap me!", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func buttonTapped() {
        label.text = "Button tapped!"
    }

}