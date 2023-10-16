import UIKit


final class DetailsViewController: UIViewController {
    
    private var dataArr = [String]()
    
    private lazy var pathLogList: UITableView = {
        let pathLogList = UITableView()
        pathLogList.register(CustomCell.self, forCellReuseIdentifier: "cell")
        pathLogList.delegate = self
        pathLogList.dataSource = self
        pathLogList.frame = view.bounds
        return pathLogList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pathLogList)
        Singleton.graph.detailsInfoArr.isEmpty ? dataArr.append("🚇 Машинист отдыхает... 💤") : (dataArr = Singleton.graph.detailsInfoArr)
    }
}

@available(iOS 15.0, *)
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pathLogList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return
            UITableViewCell(frame: .zero)
        }
        cell.stationLabel.text = dataArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArr.count
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
