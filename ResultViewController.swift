import UIKit

class ResultViewController: UIViewController {
    var questionNumber:Int = 0
    var correctAnswer:Int = 0
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet weak var TextMessege: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let point :Double = Double(correctAnswer) / Double(questionNumber)
        
        print("Result: -> \(correctAnswer)/\(questionNumber), punti-> \(point*100)%")
        ResultLabel.text = String("punti -> \(point*100)%")
        
        if point == 1 {
            TextMessege.text = String("buono")
                   } else if point > 0.7 {
            TextMessege.text = String("scarso")
                    } else if point > 0.3 {
            TextMessege.text = String("")
                   } else {
            TextMessege.text = String("")
                    }
        
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

}
