//
//  NewStudentVC.swift
//  StudentManageCore
//
//  Created by Aamir Burma on 10/07/21.
//

import UIKit

class NewStudentVC: UIViewController {

    var studets:Students?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Student Name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let ageTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Age"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let spidTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "SPID"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveStudent), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Student Data"
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(spidTextField)
        view.addSubview(ageTextField)
        view.addSubview(saveButton)
        
        if let stud = studets {
            nameTextField.text = stud.name
            ageTextField.text = String(stud.age)
            spidTextField.text = String(stud.spid)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: 300, width: view.width - 80, height: 40)
        ageTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
        spidTextField.frame = CGRect(x: 40, y: ageTextField.bottom + 20, width: view.width - 80, height: 40)
        saveButton.frame = CGRect(x: 40, y: spidTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func saveStudent(){
        let name = nameTextField.text!
        let age = Int(ageTextField.text!)!
        let spid = Int(spidTextField.text!)!
//        let stud = Students(id: 0, name: name, age: age, spid: spid)
        if let stud = studets {
            CoreDataHandler.shared.update(stud: stud, name: name, age: age, spid: spid){
                [weak self] in self?.navigationController?.popViewController(animated: true)
                print("Update Successfully")
                
            }
        }
        else{
            CoreDataHandler.shared.insert(name: name, age: age, spid: spid){
                [weak self] in self?.navigationController?.popViewController(animated: true)
                print("Insert Successfully")
            }
            
        }
    }
}
