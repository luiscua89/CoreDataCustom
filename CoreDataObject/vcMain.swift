//
//  vcMain.swift
//  CoreDataObject
//
//  Created by Luis Cua Catzin on 14/06/15.
//  Copyright (c) 2015 Luis Cua Catzin. All rights reserved.
//

import UIKit
import CoreData

class vcMain: UIViewController {
    
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    
    @IBAction func btnSave_clicked(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: ent!, insertIntoManagedObjectContext: context)
        
        newUser.username = txtUsername.text
        newUser.password = txtPassword.text
        
        context.save(nil)
        
        println(newUser)
        println("saved!")
        
    }
    
    
    @IBAction func btnLoad_clicked(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0
        {
           
            for user in results
            {
                var thisUser = user as! Users
                println(thisUser.toString())
                thisUser.addFunnyPrefix("jajajajaja")
                println(thisUser.toString())
            }
            
            println("\(results.count) found!")
        }
            
        else{
            println("Sin resultados encontrados")
        }
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
