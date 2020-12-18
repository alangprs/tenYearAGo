import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dataPickerView: UIDatePicker!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var laberView: UILabel!
    //讀取系統日期
    let dateformatter = DateFormatter()
    //設定變數在@IBAction func changSlider使用
    var sliderNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataPickerView.locale = Locale(identifier: "zh-TW")
        dateformatter.dateFormat = "yyyy"
    }
   
    //加入圖片
    let imageName = ["2009","2010","2012","2013","2014","2015","2016","2017","2018","2019","2020"]
    
    @IBAction func changSlider(_ sender: UISlider) {
        //拉動slider換圖片
        sliderNumber = Int(sliderView.value)
        imageView.image = UIImage(named: String(imageName[sliderNumber]))
       //顯示lable文字
        laberView.text = String("\(imageName[sliderNumber])年")
    }
    @IBAction func changDataPicker(_ sender: Any) {
        
    }
    
    

}

