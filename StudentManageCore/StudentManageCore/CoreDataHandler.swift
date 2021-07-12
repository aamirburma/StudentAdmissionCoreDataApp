//
//  CoreDataHandler.swift
//  StudentManageCore
//
//  Created by Aamir Burma on 09/07/21.
//

import UIKit
import Foundation
import CoreData

class CoreDataHandler{
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext: NSManagedObjectContext?
    
    private init(){
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
    func insert(name:String, age:Int, spid:Int, completion: @escaping() -> Void) {
        let stud = Students(context: managedObjectContext!)
        stud.name = name
        stud.spid = Int64(spid)
        stud.age = Int64(age)
        save()
        completion()
    }
    
    func insertNotice(notice:String, completion: @escaping() -> Void) {
        let notes = Notice(context: managedObjectContext!)
        notes.note = notice
        save()
        completion()
    }
    
    func update(stud:Students,name:String, age:Int, spid:Int, completion: @escaping() -> Void) {
        stud.name = name
        stud.spid = Int64(spid)
        stud.age = Int64(age)
        save()
        completion()
    }
    
    func delete(stud:Students, completion: @escaping() -> Void) {
        managedObjectContext!.delete(stud)
        save()
        completion()
    }
    

    
    func fetch() -> [Students] {
        let fetchRequest:NSFetchRequest<Students> = Students.fetchRequest()
        
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequest)
            return studArray!
        } catch{
            print("Sorry]\n")
            print(error)
            return [Students]()
        }
    }
    
    func studFetch(spid:Int) -> [Students] {
        let fetchRequest:NSFetchRequest<Students> = Students.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "spid = \(spid)")
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequest)
            print(studArray!)
            return studArray!
        } catch{
            print("Sorry]\n")
            print(error)
            return [Students]()
        }
        
            
    }
}
