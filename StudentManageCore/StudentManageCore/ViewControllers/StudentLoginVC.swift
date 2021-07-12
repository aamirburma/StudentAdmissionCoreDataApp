//
//  StudentLoginVC.swift
//  StudentManageCore
//
//  Created by Aamir Burma on 09/07/21.
//

import UIKit

class StudentLoginVC: UIViewController {
    
    private var studArray = [Students]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.title = "Login"
        title = "Student Login"
        view.addSubview(myPassword)
        view.addSubview(myTextField)
        view.addSubview(myBtn)
        view.backgroundColor = .systemTeal
    }
    
    /** Adjust layout*/
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField.frame = CGRect(x: 20,y: 300, width: view.width - 40, height: 50)
        myPassword.frame = CGRect(x: 20,y: myTextField.bottom + 10, width: view.width - 40, height: 50)
        myBtn.frame = CGRect(x: 20,y: myPassword.bottom + 10, width: view.width - 40, height: 50)
        
    }

    /** Textbox for taking user name*/
    private let myTextField:UITextField = {
        let myUITextField = UITextField()
        myUITextField.placeholder = "ENTER USER NAME"
        myUITextField.textColor = .systemGreen
        myUITextField.autocorrectionType = .no
        myUITextField.autocapitalizationType = .none
        myUITextField.borderStyle = .roundedRect
        myUITextField.textAlignment = .center
        myUITextField.borderStyle = .roundedRect
        return myUITextField
    }()
    
    /** Textbox for password input*/
    private let myPassword:UITextField = {
        let myUITextField = UITextField()
        myUITextField.placeholder = "ENTER PASSWORD "
        myUITextField.textColor = .systemGreen
        myUITextField.isSecureTextEntry = true
        myUITextField.autocorrectionType = .no
        myUITextField.autocapitalizationType = .none
        myUITextField.borderStyle = .roundedRect
        myUITextField.textAlignment = .center
        myUITextField.borderStyle = .roundedRect
        return myUITextField
    }()
    
    /** Login btn*/
    private let myBtn: UIButton = {
        let myBtn = UIButton()
        myBtn.setTitle("LOGIN", for: .normal)
        myBtn.setTitleColor(.white, for: .normal)
        myBtn.layer.borderWidth = 5
        myBtn.addTarget(self, action: #selector(loginfunc), for: .touchUpInside)
        myBtn.backgroundColor = .systemGray
        myBtn.layer.cornerRadius = 27
        return myBtn
    }()
    
    /** Login check function*/
    @objc private func loginfunc(){
//        let x = Int(myTextField) ?? 0
        if let x = Int(myTextField.text!) {
            // do something with billTotal
            studArray = CoreDataHandler.shared.studFetch(spid: x)
            if (studArray.count > 0 && myTextField.text == myPassword.text){
                UserDefaults.standard.setValue(studArray[0].name, forKey: "name")
                UserDefaults.standard.setValue(studArray[0].spid, forKey: "spid")
                UserDefaults.standard.setValue(studArray[0].age, forKey: "age")
                let vc = StudentDetailVC()
                navigationController?.pushViewController(vc, animated: false)
            }
            else{
                let  alert = UIAlertController(title: "Sorry!", message: "Incorrect username or password", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                            present(alert, animated: true, completion: nil)
            }
        } else {
            let  alert = UIAlertController(title: "Sorry!", message: "Incorrect username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true, completion: nil)
        }
    }
}
