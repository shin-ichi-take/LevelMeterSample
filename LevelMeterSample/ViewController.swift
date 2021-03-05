//
//  ViewController.swift
//  LevelMeterSample
//
//  Created by 竹村信一 on 2021/03/04.
//

import UIKit
import CoreMotion



class ViewController: UIViewController {
    var cmotion:CMMotionManager = CMMotionManager()
    lazy var xLabel = getXLabel()
    lazy var yLabel = getYLabel()
    lazy var zLabel = getZLabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(xLabel)
        view.addSubview(yLabel)
        view.addSubview(zLabel)
        
        // 更新周期を設定.
        cmotion.accelerometerUpdateInterval = 0.1
        
        // 加速度の取得を開始.
        cmotion.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(accelerometerData, error) in
            if let e = error {
                print("error!!")
                print(e.localizedDescription)
                return
            }
            guard let data = accelerometerData else {
                return
            }
            
            self.xLabel.text = "x=\(data.acceleration.x)"
            self.yLabel.text = "y=\(data.acceleration.y)"
            self.zLabel.text = "z=\(data.acceleration.z)"
            
        })
        
        
    }
    
    // Labelを作成.
    func getXLabel() -> UILabel{
        let myXLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
        myXLabel.backgroundColor = .blue
        myXLabel.layer.masksToBounds = true
        myXLabel.layer.cornerRadius = 10.0
        myXLabel.textColor = .white
        myXLabel.shadowColor = .gray
        myXLabel.textAlignment = .center
        myXLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        return myXLabel
    }
    
    func getYLabel() -> UILabel{
        let myYLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
        myYLabel.backgroundColor = .orange
        myYLabel.layer.masksToBounds = true
        myYLabel.layer.cornerRadius = 10.0
        myYLabel.textColor = .white
        myYLabel.shadowColor = .gray
        myYLabel.textAlignment = .center
        myYLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 280)
        return myYLabel
    }
    
    func getZLabel() -> UILabel{
        let myZLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
        myZLabel.backgroundColor = .red
        myZLabel.layer.masksToBounds = true
        myZLabel.layer.cornerRadius = 10.0
        myZLabel.textColor = .white
        myZLabel.shadowColor = .gray
        myZLabel.textAlignment = .center
        myZLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 360)
        return myZLabel
    }
}

