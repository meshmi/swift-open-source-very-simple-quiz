import UIKit

class QuizViewController: UIViewController {

    var questionNumber:Int = 5

    var sum:Int = 0

    var correctAnswer:Int = 0

    var random:Int = 0

    var quizArray = [NSMutableArray]()
    

    var count:Float = 0.0

    var timer:NSTimer!

    @IBOutlet var quizTextView: UITextView!
    

    @IBOutlet var choiceButtons: Array<UIButton>!

    @IBOutlet var AnswerMark: UIImageView!
    let AnswerTrue:UIImage!  = UIImage(named: "true.png")
    let AnswerFalse:UIImage! = UIImage(named: "false.png")
    var AnsTrueAnimeArray : Array<UIImage> = []
    var AnsFalseAnimeArray : Array<UIImage> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        AnsTrueAnimeArray.append(AnswerTrue)
        AnsFalseAnimeArray.append(AnswerFalse)

        quizArray.append(["in che data è stata fondata la Apple? ","10º giugno 1986 a Cupertino","2º settembre 1979 a Cupertino","1º aprile 1976 a Cupertino",3,3])
        quizArray.append(["in che anno usci il sistema operativo Apple (osX)? ","1992","2000","2005",2,3])
        quizArray.append(["Steve Jobs è il fondatore di ?","Apple","Microsoft","SONY",1,3])
        quizArray.append(["iOS si programma con? ","Java","Ruby","Swift",3,3])
        quizArray.append(["quale fu il più grande successo di Apple? ","itunes","iwatch","android",1,3])
       
        
        delay(3.0, closure: { () -> () in
            self.AnswerMark.alpha = 0.0
        })
        
        choiceQuiz()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "OnUpdate:", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func choiceQuiz() {
        
        if quizArray.count==0 {
            random = 0
        }else{
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        }
                quizTextView.text = quizArray[random][0] as! NSString as String
        
        
              for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle(quizArray[random][i+1] as! NSString as String, forState: .Normal)
            
                        choiceButtons[i].tag = i + 1;
            
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        print("\(sum)hhhhh( 残り\(questionNumber-sum+1)h ), ", terminator: "")
        print("random　-> \(random)")
        print("\(sum)hhhh(Q\(quizArray[random][5] as! Int)) h \(sender.tag)hhhhhhh ")
        AnswerMark.alpha = 1.0
        
        if quizArray[random][4] as! Int == sender.tag {
            
            correctAnswer++
            print("-> qwe")
            let image = UIImage(named: "true.png")!
            AnswerMark.image = image
            
        }else{
            
            print("-> eqw")
            let image = UIImage(named: "false.png")!
            AnswerMark.image = UIImage(named: "quiz1.jpg")!
                  }
        
        delay(0.6, closure: { () -> () in
            self.AnswerMark.alpha = 0.0
            self.AnswerMark.image = nil
            
                        if self.sum == self.questionNumber {
                self.performSegueToResult()              }else{
                self.quizArray.removeAtIndex(self.random);                  self.choiceQuiz()             }
        })
        count = 5
        
        print(("correctAnswer"))
     
    }
    
    

    func OnUpdate(timer : NSTimer){
        self.count -= 1
        print(self.count)
        
    }
    
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.questionNumber = self.questionNumber
            ResultView.correctAnswer  = self.correctAnswer }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
}


