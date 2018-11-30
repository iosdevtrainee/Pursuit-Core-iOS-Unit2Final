//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by J on 11/30/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  public var crayon: Crayon!
  private var currentRed: CGFloat! = 1.0{
    didSet {
      let color = currentValuesToColor()
      redTextField.text = "\(Helpers.roundNumber(number: currentRed))"
      redSlider.value = Float(currentRed)
      updateBackgroundColor(color: color)
    }
  }
  private var currentBlue: CGFloat! = 1.0{
    didSet {
      let color = currentValuesToColor()
      blueTextField.text = "\(Helpers.roundNumber(number: currentBlue))"
      blueSlider.value = Float(currentBlue)
      updateBackgroundColor(color: color)
    }
  }
  private var currentGreen: CGFloat! = 1.0{
    didSet {
      let color = currentValuesToColor()
      greenTextField.text = "\(Helpers.roundNumber(number: currentGreen))"
      greenSlider.value = Float(currentGreen)
      updateBackgroundColor(color: color)
    }
  }
  private var currentAlpha: CGFloat! = 1.0{
    didSet {
      let color = currentValuesToColor()
      alphaStepper.value = Double(currentAlpha)
      alphaTextField.text = "\(Helpers.roundNumber(number: currentAlpha))"
      updateBackgroundColor(color: color)
    }
  }
  private var color: UIColor!
  @IBOutlet weak var redTextField: UITextField!
  @IBOutlet weak var blueTextField: UITextField!
  @IBOutlet weak var greenTextField: UITextField!
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var resetButton: UIButton!
  @IBOutlet weak var alphaTextField: UITextField!
  @IBOutlet weak var alphaStepper: UIStepper!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Color Palette"
    redTextField.delegate = self
    blueTextField.delegate = self
    greenTextField.delegate = self
    reset(sender:resetButton)
    // Do any additional setup after loading the view.
  }
  
  private func resetColor(crayon:Crayon){
    let rgb = Helpers.crayonToRGB(crayon: crayon)
    currentRed = rgb.red
    currentBlue = rgb.blue
    currentGreen = rgb.green
    currentAlpha = 1.0
    color = currentValuesToColor()
    updateBackgroundColor(color:color)
  }
  
  
  @IBAction private func onColorSliderUpdate(_ sender: UISlider) {
    switch sender {
    case blueSlider:
      currentBlue = CGFloat(blueSlider.value)
    case redSlider:
      currentRed = CGFloat(redSlider.value)
    case greenSlider:
      currentGreen = CGFloat(greenSlider.value)
    default:
      return
    }
    
  }
  @IBAction private func onAlphaChange(_ sender:UIStepper){
    let value = sender.value
    currentAlpha = CGFloat(value)
  }
  
  @IBAction private func reset(sender: UIButton) {
    resetDisplay(crayon: crayon)
    resetColor(crayon: crayon)
  }
  
  private func updateBackgroundColor(color:UIColor){
    view.backgroundColor = color
  }
  
  private func currentValuesToColor() -> UIColor{
    return UIColor(displayP3Red: currentRed,
                   green: currentGreen,
                   blue: currentBlue,
                   alpha: currentAlpha)
    
  }
  
  private func resetDisplay(crayon:Crayon){
    let rgb = Helpers.crayonToRGB(crayon: crayon)
    blueSlider.value = Float(rgb.blue)
    blueTextField.text = "\(rgb.blue)"
    redSlider.value = Float(rgb.red)
    redTextField.text = "\(rgb.red)"
    greenSlider.value = Float(rgb.green)
    greenTextField.text = "\(rgb.green)"
    alphaTextField.text = "\(rgb.green)"
    
  }
  
  
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension DetailViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let text = textField.text,
      let colorValue = Float(text),
    colorValue <= 1.0 else { return false }
    switch textField {
    case blueTextField:
      currentBlue = CGFloat(colorValue)
    case redTextField:
      currentRed = CGFloat(colorValue)
    case greenTextField:
      currentGreen = CGFloat(colorValue)
    case alphaTextField:
      currentAlpha = CGFloat(colorValue)
    default:
      return false
    }
    return true
  }
}
