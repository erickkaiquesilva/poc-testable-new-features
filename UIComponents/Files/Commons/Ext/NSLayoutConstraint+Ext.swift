import UIKit

enum NSLayoutConstraintType {

    case equal
    case greaterThanOrEqual
    case lessThanOrEqual

    func get() -> NSLayoutConstraint.Relation {
        switch self {
        case .equal:
            return NSLayoutConstraint.Relation.equal
        case .greaterThanOrEqual:
            return NSLayoutConstraint.Relation.greaterThanOrEqual
        case .lessThanOrEqual:
            return NSLayoutConstraint.Relation.lessThanOrEqual
        }
    }
}

extension NSLayoutConstraint {

    static func inset(view: UIView, inSuperview superView: UIView,
                      withInset inset: UIEdgeInsets? =  nil) -> [NSLayoutConstraint] {
        return [.top(firstView: superView, secondView: view, relation: .equal, constant: -CGFloat(inset?.top ?? 0) ),
                .left(firstView: superView, secondView: view, relation: .equal, constant: -CGFloat(inset?.left ?? 0) ),
                .right(firstView: superView, secondView: view, relation: .equal, constant: -CGFloat(inset?.right ?? 0) ),
                .bottom(firstView: superView, secondView: view, relation: .equal, constant: -CGFloat(inset?.bottom ?? 0) )]
    }

    // SETUP COSNTRAINT TOP
    static func top(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  multiplier: 1,
                                  constant: constant)
    }

    // SETUP COSNTRAINT LEFT
    static func left(firstView: UIView,
                     secondView: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  relatedBy: relation.get(), 
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  multiplier: 1, 
                                  constant: constant)
    }

    // SETUP COSNTRAINT RIGHT
    static func right(firstView: UIView, secondView: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, 
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  multiplier: 1,
                                  constant: constant)
    }

    // SETUP COSNTRAINT BOTTOM
    static func bottom(firstView: UIView, secondView: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                  relatedBy: relation.get(), 
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                  multiplier: 1,
                                  constant: constant)
    }

    // SETUP COSNTRAINT BASELINE
    static func baseLine(firstView: UIView, secondView: UIView,
                         relation: NSLayoutConstraintType = .equal, 
                         constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                  multiplier: 1, 
                                  constant: constant)
    }

    // SETUP COSNTRAINT OVER
    static func over(topItem: UIView, 
                     bottomItem: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: topItem,
                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                  relatedBy: relation.get(),
                                  toItem: bottomItem,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  multiplier: 1,
                                  constant: -1 * constant)
    }

    // SETUP COSNTRAINT ASIDE
    static func aside(left: UIView, right: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: left, 
                                  attribute: NSLayoutConstraint.Attribute.right,
                                  relatedBy: relation.get(), 
                                  toItem: right,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  multiplier: 1,
                                  constant: -1 * constant)
    }

    // SETUP COSNTRAINT HEIGHT
    static func height(firstView: UIView, secondeView: UIView,
                       relation: NSLayoutConstraintType = .equal, constant: Float = 0, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, 
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(),
                                  toItem: secondeView,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: multiplier,
                                  constant: CGFloat(constant))
    }

    static func height(view: UIView, 
                       relation: NSLayoutConstraintType = .equal,
                       constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(), 
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1, 
                                  constant: constant)
    }

    // SETUP COSNTRAINT WIDTH
    static func width(firstView: UIView, secondView: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat,
                      multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, 
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  multiplier: multiplier,
                                  constant: constant)
    }

    static func width(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(),
                                  toItem: nil,
                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1, 
                                  constant: constant)
    }

    static func aspectRatio(view: UIView, 
                            relation: NSLayoutConstraintType = .equal,
                            constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(),
                                  toItem: view,
                                  attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: constant,
                                  constant: 0)
    }

    static func centerY(firstView: UIView, secondView: UIView,
                        attribute: NSLayoutConstraint.Attribute = .centerY,
                        relation: NSLayoutConstraintType = .equal,
                        constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.centerY,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: attribute,
                                  multiplier: 1,
                                  constant: constant)
    }

    static func centerX(firstView: UIView, secondView: UIView,
                        relation: NSLayoutConstraintType = .equal,
                        constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: NSLayoutConstraint.Attribute.centerX,
                                  relatedBy: relation.get(),
                                  toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.centerX,
                                  multiplier: 1, 
                                  constant: constant)
    }
}

extension Array where Element == NSLayoutConstraint {

    func activate() {
        NSLayoutConstraint.activate(self)
    }

    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
}
