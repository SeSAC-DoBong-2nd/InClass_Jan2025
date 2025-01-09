//
//  ViewController.swift
//  thirdWeek_SeSAC
//
//  Created by 박신영 on 1/8/25.
//

import UIKit

import MapKit

struct User {
    
    let name: String
    
}

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var mapView: MKMapView!
    
    let pickerView = UIPickerView()
    let color: [UIColor] = [.blue]
    
    let user: [User] = [
        User(name: "a"),
        User(name: "b")
    ]
    
    let user2: [User] = [
        .init(name: "a"),
        .init(name: "b")
    ]
    
    
    let list = ["가", "나", "다"]
    let array = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textField 커서 색 설정
        secondTextField.tintColor = .red
        secondTextField.inputView = pickerView
        
        textField.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        mapView.delegate = self
        configureMapView()
    }

}

//MARK: - Private Extension
private extension ViewController {
    
    func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "훈하하"
        mapView.addAnnotation(annotation)
    }
    
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    //키보드에서 return 키 눌렀을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textField {
            view.endEditing(true)
        }
        
        //return의 의미는 return 키를 누룰 수 있도록 기능만 열어두는 것
        return true
    }
    
    //실시간 text 추적 안됨
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "")
        return true
    }
    
    //실시간 text 추적
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("🔥\(textField.text ?? "")")
    }
    
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return component == 0 ? (textField.text = list[row]) : (secondTextField.text = array[row])
    }
    
}

//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? list.count : array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? list[row] : array[row]
    }
    
}

//MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate { }

