//
//  NewNoticeVC.swift
//  StudentManageCore
//
//  Created by Aamir Burma on 11/07/21.
//

import UIKit

class NewNoticeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Notice for students"
        view.backgroundColor = .systemTeal
        view.addSubview(saveButton)
        view.addSubview(noticeTextArea)
        // Do any additional setup after loading the view.
    }
    
    
    private let noticeTextArea:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemFill
        textView.textColor = .systemGreen
        textView.layer.cornerRadius = 6
        return textView
    }()
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveNotice), for: .touchUpInside)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noticeTextArea.frame = CGRect(x: 40, y: 180, width: view.width - 80, height: 300)
        saveButton.frame = CGRect(x: 40, y: noticeTextArea.bottom + 20, width: view.width - 80, height: 30)
    }
    
    @objc private func saveNotice(){
        let name = noticeTextArea.text!
//        let stud = Students(id: 0, name: name, age: age, spid: spid)
//        if let stud = studets {
//            CoreDataHandler.shared.update(stud: stud, name: name, age: age, spid: spid){
//                [weak self] in self?.navigationController?.popViewController(animated: true)
//                print("Update Successfully")
//
//            }
//        }
//        else{
            CoreDataHandler.shared.insertNotice(notice: name){
                [weak self] in self?.navigationController?.popViewController(animated: true)
                print("Insert Successfully")
            }
//
//        }
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
