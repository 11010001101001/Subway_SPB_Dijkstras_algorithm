import UIKit

final class DetailsViewController: UIViewController {
    private var dataArr = [String]()
    
    private lazy var pathList: UITableView = {
        let list = UITableView()
        list.register(PathCell.self, forCellReuseIdentifier: "cell")
        list.delegate = self
        list.dataSource = self
        list.rowHeight = UITableView.automaticDimension
        list.estimatedRowHeight = 10
        list.separatorStyle = .none
        list.frame = view.bounds
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(pathList)
        Singleton.graph.pathDetails.isEmpty ? dataArr.append("🚇 Машинист отдыхает... 💤") : (dataArr = Singleton.graph.pathDetails)
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pathList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PathCell else { return
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
