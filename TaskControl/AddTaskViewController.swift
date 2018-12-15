
import UIKit

class AddTaskViewController: UIViewController {
    
    // MARK: - Properties
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var task: Task?

    
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
     // MARK: -
    
    var taskCategory = "MustDo"

    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = task {
            taskTextField.text = task.name
            taskCategory = task.category!
            switch task.category! {
            case "MustDo":
                categorySegmentedControl.selectedSegmentIndex = 0
            case "WantToDo":
                categorySegmentedControl.selectedSegmentIndex = 1
            default:
                categorySegmentedControl.selectedSegmentIndex = 0
       
        }
        }
    }
     // MARK: - Actions of Buttons
    
        
    @IBAction func categoryChosen(_ sender: UISegmentedControl) {
     // choose category of task
        switch sender .selectedSegmentIndex{
        case 0:
            taskCategory = "MustDo"
        case 1:
            taskCategory = "WantToDo"
        default:
            taskCategory = "MustDo"
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        let taskName = taskTextField.text
        if taskName == "" {
            dismiss(animated: true, completion: nil)
            return
        }
        
        // 受け取った値が空であれば、新しいTask型オブジェクトを作成する
        if task == nil {
            task = Task(context: context)
        }
        
        // 受け取ったオブジェクト、または、先ほど新しく作成したオブジェクトそのタスクのnameとcategoryに入力データを代入する
        if let task = task {
            task.name = taskName
            task.category = taskCategory
        }
        
        // 変更内容を保存する
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
