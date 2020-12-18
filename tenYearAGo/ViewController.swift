import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dataPickerView: UIDatePicker!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var laberView: UILabel!
    //讀取系統日期
    let dateformatter = DateFormatter()
    //設定變數在@IBAction func changSlider使用
    var sliderNumber = 0
    //設定變數在@IBAction func changDataPicker 使用
    var year:String = "2009"
    let play = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://r3---sn-ab5szn76.googlevideo.com/videoplayback?expire=1608329279&ei=39PcX_eCM6qxhwb4grgg&ip=216.151.180.40&id=6c32ff1412509c79&itag=18&source=youtube&requiressl=yes&mh=DX&mm=31%2C26&mn=sn-ab5szn76%2Csn-p5qs7n76&ms=au%2Conr&mv=m&mvi=3&pl=24&initcwndbps=1102500&vprv=1&mime=video%2Fmp4&ns=OBr-9olNaCUsRlqz6by0qpYF&gir=yes&clen=22219942&ratebypass=yes&dur=338.663&lmt=1601115406960398&mt=1608307258&fvip=3&c=WEB&txp=5430432&n=Pskqe5df9XJv1XOi9&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgAuXS-s6SI-Ya1ViX-CkDzEfQcNjaYuiBxE5G_glgoNMCIQCkxSwcikXLghZq_ZPo2HQn6WxCRPdZzShCwCijoaW7cA%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAOXYs_rGFriYhDLdyo8tg9tZTj5BAwz7L-6m0isq0ra0AiB1GPk484djVCX4yVvh9j2TeTAac6EtfnuvQcDPIhMtsw%3D%3D")
            let playItem = AVPlayerItem(url: url!)
        play.replaceCurrentItem(with: playItem)
        play.play()
            
        // Do any additional setup after loading the view.
        dataPickerView.locale = Locale(identifier: "zh-TW")
        dateformatter.dateFormat = "yyyy/mm"
    }
   
    //加入圖片
    let imageName = ["2009","2010","2012","2013","2014","2015","2016","2017","2018","2019","2020"]
    
    @IBAction func changSlider(_ sender: UISlider) {
        //拉動slider換圖片
        sliderNumber = Int(sliderView.value)
        imageView.image = UIImage(named: String(imageName[sliderNumber]))
//        拉動slider DataPicker跟著連動 ！！？？
        let newDate = DateComponents(calendar: Calendar.current, year: Int(imageName[sliderNumber])).date
        dataPickerView.date = newDate!
       //顯示lable文字
        laberView.text = String("\(imageName[sliderNumber])年")
    }
    //更換日期
    @IBAction func changDataPicker(_ sender: Any) {
        //更改日期換圖片 研究這段意思！！！？？
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: dataPickerView.date)
        let year = dateComponents.year!
        let picName = "\(year)"
        imageView.image = UIImage(named: picName)
        sliderView.value = Float(year - 2009)
        laberView.text = "\(year)年"
       
        
        
    }
    
    

}

