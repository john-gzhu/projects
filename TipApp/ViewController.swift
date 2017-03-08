//
//  ViewController.swift
//  TipApp
//
//  Created by Genjiang Zhu on 3/5/17.
//  Copyright © 2017 Genjiang Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billText: UITextField!
        {
        didSet {
            billText.alpha = 0
        }
    }
    
    @IBOutlet weak var testTipSelection: UITextField!
    
    
    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var dropDown: UIPickerView!
    
    
    var listTip = ["15%","20%","25%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from anib.
          self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back.jpeg")!)
        
        billText.text = "0.00"
        labelTip.text = "15%"
        dropDown.selectRow(0, inComponent: 0, animated: false)
        
        animateView()
        
    }

    func animateView()
    {
        UIView.animate(withDuration: 3)
        {
            self.billText.alpha = 1
            self.billText.text = "110"
            self.billText.tintColor = UIColor.darkGray
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func updateValue()
    {
        let bill = Double(billText.text!) ?? 0
    
        var tipPercent : Double = 0.0
        var tipValue = listTip[dropDown.selectedRow(inComponent: 0)]
        if (tipValue == "15%") {
            tipPercent = 0.15
        }
        else if (tipValue == "20%")
        {
            tipPercent = 0.20
        }
        else if (tipValue == "25%")
        {
            tipPercent = 0.25;
        }
        
        let tip = bill * tipPercent
        
        let total = tip + bill
    
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onBillChange(_ sender: Any) {
        updateValue()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listTip.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listTip[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelTip.text = listTip[row]
        
        updateValue()
    }
    
    //life cycle methods
    override func viewWillAppear(_ animated: Bool) {
        
        //billText.center.x -= view.bounds.width
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //UIView.animate(withDuration: 0.5) {
        //    self.billText?.center.x += view.bounds.width
        //}
        
        let defaultTipPercent = UserDefaults.standard
        let tipPercent = defaultTipPercent.object(forKey: "DefaultTipPercent")
        
        if (tipPercent != nil) {
            let tip = defaultTipPercent.double(forKey: "DefaultTipPercent")
            if (tip == 15)  {
                dropDown.selectRow(0, inComponent:  0, animated: false)
                labelTip.text = "15%"
            }
            else if tip == 20 {
                dropDown.selectRow(1, inComponent:  0, animated: false)
                labelTip.text = "20%"
            }
            else if tip == 25 {
                dropDown.selectRow(2, inComponent:  0, animated: false)
                labelTip.text = "25%"
            }
            
            updateValue()
        }
        
    }
}

