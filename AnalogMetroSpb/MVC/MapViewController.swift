import UIKit
import Foundation

final class MapViewController: UIViewController {
    @IBOutlet weak var mapScrollView: UIScrollView!
    @IBOutlet weak var map: UIView!
    
    private lazy var builtPathbutton = makeButton(title: "Построить", action: #selector(builtPathTapped))
    private lazy var cancelButton = makeButton(title: "Сброс", action: #selector(cancelButtonTapped))
    private lazy var detailsButton = makeButton(title: "Подробнее", action: #selector(showDetailsTapped))
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [builtPathbutton, cancelButton])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hStackView, detailsButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 16
        return stack
    }()

    @objc private func builtPathTapped(gesture: UILongPressGestureRecognizer) {
        guard Singleton.pathWay.count == 2,
              Singleton.graph.path.isEmpty else { return }
        
        proceedGestureAction(gesture: gesture, button: builtPathbutton, action: { [weak self] in
            let fromId = Singleton.pathWay[0]
            let toId = Singleton.pathWay[1]
            
            Singleton.graph.dijkstrasAlgorithm(from: Vertex(data: Station(id: fromId, name: Singleton.graph.info[fromId]!)),
                                               to: Vertex(data: Station(id: toId, name: Singleton.graph.info[toId]!)))
            self?.animatePath()
        })
    }
    
    @objc private func cancelButtonTapped(gesture: UILongPressGestureRecognizer) {
        guard !Singleton.pathWay.isEmpty else { return }
        
        proceedGestureAction(gesture: gesture, button: cancelButton, action: { [weak self] in
            self?.map.subviews.forEach {
                $0.layer.removeAllAnimations()
                $0.transform = .identity
                $0.removeShadow()
            }
            
            Singleton.pathWay.removeAll()
            Singleton.graph.path.removeAll()
            Singleton.graph.pathDetails.removeAll()
        })
    }
    
    @objc private func showDetailsTapped(gesture: UILongPressGestureRecognizer) {
        proceedGestureAction(gesture: gesture, button: detailsButton, action: { [weak self] in
            self?.navigationController?.pushViewController(DetailsViewController(), animated: true)
        })
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Метро СПБ"
        setupUI()
        setZoomTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Singleton.pathWay.removeAll()
        Singleton.graph.path.removeAll()
        Singleton.graph.pathDetails.removeAll()
        
        map.subviews.forEach {
            $0.transform = .identity
            $0.removeShadow()
        }
    }
    
    private func proceedGestureAction(gesture: UILongPressGestureRecognizer,
                                      button: UILabel,
                                      action: Action?) {
        if gesture.state == .began {
            button.withAnimation(action: {
                button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                button.backgroundColor = .lightGray
            })
        } else if gesture.state == .ended {
            button.withAnimation(action: {
                button.transform = .identity
                button.backgroundColor = .darkGray
            })
            
            action?()
        }
    }
    
    private func makeButton(title: String, action: Selector?) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.layer.opacity = 0.5
        label.layer.borderWidth = 1.0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let gesture = UILongPressGestureRecognizer(target: self, action: action)
        gesture.minimumPressDuration = .zero
        label.addGestureRecognizer(gesture)
        return label
    }
    
    private func setZoomTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        tapGestureRecognizer.numberOfTapsRequired = 2
        map.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func doubleTap(gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: map)
        let rect = CGRect(origin: point, size: CGSize(width: mapScrollView.frame.width / 2,
                                                      height: mapScrollView.frame.height / 2))
        
        if mapScrollView.zoomScale == 1.0 {
            UIView.animate(withDuration: 0.25,
                           animations: {
                self.mapScrollView.zoom(to: rect, animated: true)
            })
        } else {
            UIView.animate(withDuration: 0.25,
                           animations: {
                self.mapScrollView.zoomScale = 1.0
            })
        }
    }
    
    private func setupUI() {
        configureMap()
        view.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vStackView.heightAnchor.constraint(equalToConstant: 150),
            vStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureMap() {
        mapScrollView.minimumZoomScale = 1.0
        mapScrollView.maximumZoomScale = 6.0
        mapScrollView.contentInsetAdjustmentBehavior = .always
        mapScrollView.contentInset.bottom = 160
        mapScrollView.contentSize = CGSize(width: view.frame.width * 2,
                                           height: view.frame.height * 2)
        mapScrollView.showsVerticalScrollIndicator = false
        mapScrollView.showsHorizontalScrollIndicator = false
    }
    
    private func animatePath() {
        for view in map.subviews {
            for vertex in Singleton.graph.path {
                if vertex.data.id == view.tag {
                    view.transform = .identity
                    view.removeShadow()
                    
                    UIView.animate(withDuration: 0.15,
                                   delay: 0,
                                   options: .curveEaseIn,
                                   animations: {
                        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                        view.applyShadow()
                    })
                }
            }
        }
    }
}

extension MapViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? { map }
}
