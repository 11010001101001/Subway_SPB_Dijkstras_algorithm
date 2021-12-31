import UIKit


final class DetailsViewController: UIViewController {

    var dataArr = [String]()
    
    private let myTableView: UITableView = {
       let tbl = UITableView()
        tbl.register(CustomCell.self,
                     forCellReuseIdentifier: "cell")
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTableView)
        myTableView.delegate = self
        myTableView.dataSource = self
        Singleton.graph.detailsInfoArr.isEmpty ? dataArr.append("Машинист отдыхает...🚇") : (dataArr = Singleton.graph.detailsInfoArr)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.frame = view.bounds
    }
}

@available(iOS 15.0, *)
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.stationLabel.text = dataArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count 
    }
}

final class CustomCell: UITableViewCell {
    
    let stationLabel: UILabel = {
       let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 15, weight: .heavy)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stationLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let inset: CGFloat = 10
        stationLabel.frame = CGRect(x: contentView.bounds.minX + inset,
                                    y: contentView.bounds.minY + inset,
                                    width: contentView.bounds.width - inset*2,
                                    height: contentView.bounds.height - inset*2)
    }
}
