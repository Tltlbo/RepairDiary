

import UIKit

protocol DiaryDetailViewDelegate : AnyObject {
    func didSelectDelete(indexPath : IndexPath)
}

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ContentTextView: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    weak var delegate : DiaryDetailViewDelegate?
    
    
    var diary : Diary?
    var indexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    

    private func configureView() {
        guard let diary = self.diary else { return}
        self.titleLabel.text = diary.title
        self.ContentTextView.text = diary.contents
        self.dateLabel.text = self.dateToString(date: diary.date)
    }
    
    private func dateToString(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    @IBAction func tabEditButton(_ sender: Any) {
    }
    

    @IBAction func tabDeleteButton(_ sender: Any) {
        guard let indexPath = self.indexPath else {return}
        self.delegate?.didSelectDelete(indexPath: indexPath)
        self.navigationController?.popViewController(animated: true)
        
    }
}