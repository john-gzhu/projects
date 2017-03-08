//
//  SettingsViewController.swift
//  TipApp
//
//  Created by Genjiang Zhu on 3/5/17.
//  Copyright © 2017 Genjiang Zhu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //@IBOutlet weak var testLabel: UILabel!
    //@IBOutlet weak var textTipPercent: UITextField!
    
    @IBOutlet weak var tipRadio: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultTipPercent = UserDefaults.standard
        
        let tip = defaultTipPercent.double(forKey: "DefaultTipPercent")
        if (tip == 15)  {
            tipRadio.selectedSegmentIndex = 0
        }
        else if (tip == 20)  {
            tipRadio.selectedSegmentIndex = 1
        }
        else if (tip == 25)  {
            tipRadio.selectedSegmentIndex = 2
        }
        
               // Do any additional setup after loading the view.
    }

   /* @IBAction func onTipChange(_ sender: UITextField) {
        let tipPercent = Double(textTipPercent.text!) ?? 0
        
        let defaultTipPercent = UserDefaults.standard
        defaultTipPercent.set(tipPercent, forKey: "DefaultTipPercent")
        defaultTipPercent.synchronize()
        
    }
  
    
    @IBAction func omnEditingChanged(_ sender: UITextField) {
        
        let tipPercent = Double(textTipPercent.text!) ?? 0
        
        print(tipPercent)
        
        let defaultTipPercent = UserDefaults.standard
        defaultTipPercent.set(tipPercent, forKey: "DefaultTipPercent")
        defaultTipPercent.synchronize()
    }*/
    
    
    @IBAction func onTipRadioChange(_ sender: Any)
    {
        var tipPercent = 15
        
        if (tipRadio.selectedSegmentIndex == 0)
        {
            tipPercent = 15
        }
        else if (tipRadio.selectedSegmentIndex == 1)
        {
            tipPercent = 20
        }
        else if (tipRadio.selectedSegmentIndex == 2)
        {
            tipPercent = 25
        }
        
        let defaultTipPercent = UserDefaults.standard
        defaultTipPercent.set(tipPercent, forKey: "DefaultTipPercent")
        defaultTipPercent.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
