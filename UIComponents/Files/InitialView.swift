import UIKit

final class InitialView: UIView {

    private let title: UILabel = {
        let label = UILabel()
        label.text = "Title UILabel"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "SubTitle UILabel"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()

    private let boxOne: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private let boxTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        buildHierarchy()
        addConstraints()
    }

    private func buildHierarchy() {
        addSubview(title)
        addSubview(subtitle)
        addSubview(boxOne)
        addSubview(boxTwo)
    }

    private func addConstraints() {
        title.layout.applyConstraint {
            $0.topSafeArea(aligneWith: self, offset: .xSmall)
            $0.left(alignedWith: self, offSet: .small)
            $0.right(alignedWith: self, offSet: .small)
        }
        subtitle.layout.applyConstraint {
            $0.under(view: title, offSet: .small)
            $0.left(alignedWith: self, offSet: .small)
            $0.right(alignedWith: self, offSet: .small)
        }
        boxOne.layout.applyConstraint {
            $0.under(view: subtitle, offSet: .large)
            $0.left(alignedWith: self, offSet: .small)
            $0.right(alignedWith: self, offSet: .small)
            $0.height(40)
        }
        boxTwo.layout.applyConstraint {
            $0.under(view: boxOne, offSet: .xLarge)
            $0.left(alignedWith: self, offSet: .xxLarge)
            $0.right(alignedWith: self, offSet: .xxLarge)
            $0.height(40)
        }
    }
}
