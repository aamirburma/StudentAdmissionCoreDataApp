//
//  ViewController.swift
//  StudentManageCore
//
//  Created by Aamir Burma on 09/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "LOGIN"
        view.addSubview(studentLoginButton)
        view.addSubview(adminLoginButton)
        view.backgroundColor = .systemTeal
    }
    
    /** Adjust layout*/
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adminLoginButton.frame = CGRect(x: 20,y: 300, width: view.width - 40, height: 50)
        studentLoginButton.frame = CGRect(x: 20,y: adminLoginButton.bottom + 10, width: view.width - 40, height: 50)
        
    }
    
    /** Admin Login button */
    private let adminLoginButton: UIButton = {
        let myBtn = UIButton()
        myBtn.setTitle("Admin LOGIN", for: .normal)
        myBtn.setTitleColor(.white, for: .normal)
        myBtn.layer.borderWidth = 5
        myBtn.addTarget(self, action: #selector(adminLogin), for: .touchUpInside)
        myBtn.backgroundColor = .systemGreen
        myBtn.layer.cornerRadius = 27
        return myBtn
    }()
    
    /** Student Login button */
    private let studentLoginButton: UIButton = {
        let myBtn = UIButton()
        myBtn.setTitle("Student LOGIN", for: .normal)
        myBtn.setTitleColor(.white, for: .normal)
        myBtn.layer.borderWidth = 5
        myBtn.addTarget(self, action: #selector(studnetLogin), for: .touchUpInside)
        myBtn.backgroundColor = .systemYellow
        myBtn.layer.cornerRadius = 27
        return myBtn
    }()
    
    /** Admin Login Redirection */
    @objc private func adminLogin(){
            let vc = LoginVC()
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /** Student Loginredirection */
    @objc private func studnetLogin(){
            let vc = StudentLoginVC()
            self.navigationController?.pushViewController(vc, animated: true)
    }
    


}

