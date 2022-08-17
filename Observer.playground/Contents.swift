import Foundation

protocol Subject {
   func add(observer: PropertyObserver )
   func remove(observer: PropertyObserver)
   func notify(with string: String)
}

protocol PropertyObserver {
   func didGet(newTask task: String)
}


class Teacher: Subject {
   
   private var observerCollection = NSMutableSet()
   private var homeTask = "" {
      didSet {
         notify(with: homeTask)
      }
   }
   
   func setHomeTask(task: String) {
      self.homeTask = task
   }
   
   func add(observer: PropertyObserver) {
      observerCollection.add(observer)
   }
   
   func remove(observer: PropertyObserver) {
      observerCollection.remove(observer)
   }
   
   func notify(with string: String) {
      for observer in observerCollection {
         (observer as? PropertyObserver)?.didGet(newTask: string)
      }
   }
   
}


class Student: NSObject, PropertyObserver {
   
   var homeTask = ""
   
   func didGet(newTask task: String) {
      homeTask = task
      print("new homework to be done")
   }
   
}


let teacher = Teacher()
let student = Student()
let student2 = Student()

teacher.add(observer: student)
teacher.add(observer: student2)

teacher.setHomeTask(task: "new task")

student.homeTask
student2.homeTask

teacher.remove(observer: student2)
teacher.setHomeTask(task: "new task 2")

student.homeTask
student2.homeTask

