//
//  ViewController.swift
//  Calculadora de Prestamos
//
//  Created by Tecsup on 13/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var plazoLabel: UITextField!
    @IBOutlet weak var tasaLabel: UITextField!
    @IBOutlet weak var capitalLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Calcular(_ sender: Any) {
        let P = Double(capitalLabel.text ?? "") ?? 0
        let tasaAnual = Double(tasaLabel.text ?? "") ?? 0
        let años = Double(plazoLabel.text ?? "") ?? 0
        
        if P == 0 || tasaAnual == 0 || años == 0 {
            resultadoLabel.text = "Por favor, ingresa valores válidos."
            return
        }
        
        let r = (tasaAnual / 100) / 12
        let n = años * 12
        
        let M = P * (r * pow(1 + r, n)) / (pow(1 + r, n) - 1)
        let total = M * n
        
        resultadoLabel.text = "Cuota mensual: S/.\(String(format: "%.2f", M))\nMonto total: S/.\(String(format: "%.2f", total))"
    }
    
}

