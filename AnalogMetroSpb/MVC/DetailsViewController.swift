import UIKit

final class DetailsViewController: UIViewController {
    private var dataArr = [String]()
    
    private lazy var pathLogList: UITableView = {
        let pathLogList = UITableView()
        pathLogList.register(PathLogCell.self, forCellReuseIdentifier: "cell")
        pathLogList.delegate = self
        pathLogList.dataSource = self
        pathLogList.frame = view.bounds
        return pathLogList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pathLogList)
        Singleton.graph.pathDetails.isEmpty ? dataArr.append("🚇 Машинист отдыхает... 💤") : (dataArr = Singleton.graph.pathDetails)
    }
}

@available(iOS 15.0, *)
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pathLogList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PathLogCell else { return
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

final class PathLogCell: UITableViewCell {
    lazy var stationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stationLabel)
        let inset: CGFloat = 10
        stationLabel.frame = CGRect(x: contentView.bounds.minX + inset,
                                    y: contentView.bounds.minY + inset,
                                    width: contentView.bounds.width - inset*2,
                                    height: contentView.bounds.height - inset*2)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
