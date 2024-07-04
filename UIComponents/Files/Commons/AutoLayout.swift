import UIKit

final class AutoLayout {

    let view: UIView

    var height: NSLayoutDimension {
        return view.heightAnchor
    }

    var widht: NSLayoutDimension {
        return view.widthAnchor
    }

    init(view: UIView) {
        self.view = view
    }

    func applyConstraint(_ block: ((AutoLayout) -> Void)) {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(self)
    }

    func edges(in superView: UIView, 
               with offSet: UIEdgeInsets? = nil) {
        let constraints = NSLayoutConstraint.inset(view: self.view,
                                                   inSuperview: superView,
                                                   withInset: offSet)
        
        constraints.activate()
    }

    func edges(in superView: UIView, 
               offSet: Spacing,
               priority: UILayoutPriority = .required) {
        let inset = UIEdgeInsets(top: offSet.rawValue,
                                 left: offSet.rawValue,
                                 bottom: offSet.rawValue,
                                 right: offSet.rawValue)
        let constraints = NSLayoutConstraint.inset(view: self.view,
                                                   inSuperview: superView,
                                                   withInset: inset)
        
        constraints.forEach { $0.priority = priority }
        constraints.activate()
    }

    @discardableResult
    func top(alignedWith view: UIView,
             relation: NSLayoutConstraintType = .equal,
             offSet: Spacing = .zero) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.top(firstView: self.view,
                                                secondView: view,
                                                relation: relation,
                                                constant: offSet.rawValue)
        
        constraint.isActive = true
        return constraint
        
    }

    @discardableResult
    func left(alignedWith view: UIView,
              relation: NSLayoutConstraintType = .equal,
              offSet: Spacing = .zero) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.left(firstView: self.view,
                                                 secondView: view,
                                                 relation: relation,
                                                 constant: offSet.rawValue)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func right(alignedWith view: UIView,
               relation: NSLayoutConstraintType = .equal,
               offSet: Spacing = .zero) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.right(firstView: self.view,
                                                  secondView: view,
                                                  relation: relation,
                                                  constant: -offSet.rawValue)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(alignedWith view: UIView,
                relation: NSLayoutConstraintType = .equal,
                offSet: Spacing = .zero,
                priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.bottom(firstView: self.view,
                                                   secondView: view,
                                                   relation: relation,
                                                   constant: -offSet.rawValue)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func baseLine(alignedWith view: UIView,
                  relation: NSLayoutConstraintType = .equal,
                  offSet: Spacing = .zero) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.baseLine(firstView: self.view,
                                                     secondView: view,
                                                     relation: relation,
                                                     constant: -offSet.rawValue)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func under(view: UIView,
               relation: NSLayoutConstraintType = .equal,
               offSet: Spacing = .zero) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.over(topItem: view,
                                                 bottomItem: self.view,
                                                 relation: relation,
                                                 constant: offSet.rawValue)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func above(view: UIView,
               relation: NSLayoutConstraintType = .equal,
               offSet: Spacing = .zero,
               priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.over(topItem: self.view,
                                                 bottomItem: view,
                                                 relation: relation,
                                                 constant: offSet.rawValue)
        constraint.priority = priority
        constraint.isActive = true
        
        return constraint
    }

    @discardableResult
    func right(of view: UIView,
               relation: NSLayoutConstraintType = .equal,
               offSet: Spacing = .zero) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.aside(left: view,
                                                  right: self.view,
                                                  relation: relation,
                                                  constant: offSet.rawValue)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func left(of view: UIView, 
              relation: NSLayoutConstraintType = .equal,
              offSet: Spacing = .zero) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.aside(left: self.view,
                                                  right: view,
                                                  relation: relation,
                                                  constant: offSet.rawValue)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func height(relatedTo view: UIView,
                relation: NSLayoutConstraintType = .equal,
                priority: UILayoutPriority = .required,
                multiplier: CGFloat = 1,
                _ size: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.height(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func height(relation: NSLayoutConstraintType = .equal,
                priority: UILayoutPriority = .required,
                _ size: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.height(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func height(equalTo dimension: NSLayoutDimension,
                priority: UILayoutPriority = .required,
                multiplier: Float = 1,
                _ size: Float = 0) -> NSLayoutConstraint {
        // ARRUMAR
        return NSLayoutConstraint()
    }

    @discardableResult
    func width(relatedTo view: UIView,
               relation: NSLayoutConstraintType = .equal,
               multiplier: CGFloat = 1,
               _ size: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.width(firstView: self.view,
                                                  secondView: view,
                                                  relation: relation,
                                                  constant: size,
                                                  multiplier: multiplier)
        
        constraint.isActive = true
        return constraint
        
    }

    @discardableResult
    func width(relation: NSLayoutConstraintType = .equal,
               _ size: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.width(view: self.view,
                                                  relation: relation,
                                                  constant: size)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func width(equalTo dimension: NSLayoutDimension,
               priority: UILayoutPriority = .required,
               multiplier: Float = 1,
               _ size: Float = 0) -> NSLayoutConstraint {
        // ARRUMAR
        return NSLayoutConstraint()
    }

    func size(relation: NSLayoutConstraintType = .equal,
              _ size: CGFloat) {
        width(relation: relation, size)
        height(relation: relation, size)
    }

    @discardableResult
    func verticalCenter(view: UIView,
                        relation: NSLayoutConstraintType = .equal,
                        attribute: NSLayoutConstraint.Attribute = .centerY,
                        offSet: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.centerY(firstView: self.view,
                                                    secondView: view,
                                                    attribute: attribute,
                                                    relation: relation,
                                                    constant: offSet)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func horizontalCenter(view: UIView,
                          relation: NSLayoutConstraintType = .equal,
                          offSet: CGFloat = 0,
                          priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint  = NSLayoutConstraint.centerX(firstView: self.view,
                                                     secondView: view,
                                                     relation: relation,
                                                     constant: offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    func center(in view: UIView,
                relation: NSLayoutConstraintType = .equal,
                offSet: CGFloat = 0) {
        horizontalCenter(view: view, relation: relation, offSet: offSet)
        verticalCenter(view: view, relation: relation, offSet: offSet)
    }

    func size(relatedTo view: UIView,
              relation: NSLayoutConstraintType = .equal,
              offSet: CGFloat = 0) {
        width(relatedTo: view, relation: relation, offSet)
        height(relatedTo: view, relation: relation, offSet)
    }

    @discardableResult
    func topSafeArea(aligneWith: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     offset: Spacing = .zero,
                     priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = self.view.topAnchor.constraint(equalTo: aligneWith.safeAreaLayoutGuide.topAnchor,
                                                        constant: offset.rawValue)
        constraint.isActive = true
        constraint.priority = priority
        
        return constraint
    }
    
    @discardableResult
    func bottomSafaArea(alignedWith: UIView,
                        relation: NSLayoutConstraintType = .equal,
                        offset: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = self.view.bottomAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.bottomAnchor, constant: -offset)
        
        constraint.isActive = true
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func leftSafeArea(alinedWith: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = self.view.leftAnchor.constraint(equalTo: alinedWith.safeAreaLayoutGuide.leftAnchor,
                                                         constant: offset)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func rightSafeArea(alignedWith: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = self.view.rightAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.rightAnchor,
                                                          constant: -offset)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func aspectRatio(relation: NSLayoutConstraintType = .equal, 
                     offset: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.aspectRatio(view: self.view, constant: offset)
        
        constraint.isActive = true
        return constraint
    }
    
    func removeConstraints() {
        self.view.removeConstraints(self.view.constraints)
    }
    
    func bottomSafeArea(alignedWith: UIView, 
                        offsetForStandardLayouts offset: Spacing) {
        self.bottomSafaArea(alignedWith: alignedWith,
                            priority: .defaultLow)
        self.bottom(alignedWith: alignedWith,
                    relation: .lessThanOrEqual,
                    offSet: offset,
                    priority: .defaultHigh)
    }

    func verticalCenterBetween(upperAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, 
                               lowerAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        let topLayoutGuide = UILayoutGuide()
        let bottomLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(topLayoutGuide)
        view.addLayoutGuide(bottomLayoutGuide)
    }
    
    @discardableResult
    private func anchor(_ dimensionKeyPath: KeyPath<UIView, NSLayoutDimension>,
                        to dimension: NSLayoutDimension,
                        priority: UILayoutPriority = .required,
                        multiplier: CGFloat = 1,
                        _ size: CGFloat = 0) -> NSLayoutConstraint {
        let anchor = view[keyPath: dimensionKeyPath]
        let constraint = anchor.constraint(equalTo: dimension,
                                           multiplier: multiplier,
                                           constant: size)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
}
