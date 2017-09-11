//
//  YGActionSheetViewController.swift
//  Pods-YGActionSheetViewController_Example
//
//  Created by 高宇 on 2017/9/11.
//

import Foundation
import SnapKit

public enum YGActionSheet {
    case index(row: Int)
    case cancel
}

public class YGActionSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var text: [String]!
    public var action: ((YGActionSheet) -> Void)?
    fileprivate var alertTableView: UITableView!
    fileprivate var bottomConstraint: Constraint!
    fileprivate var heightConstraint: Constraint!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        alertTableView = UITableView()
        alertTableView.delegate = self
        alertTableView.dataSource = self
        alertTableView.alpha = 0
        self.view.addSubview(alertTableView)
        alertTableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            self.bottomConstraint = make.bottom.equalTo(100).constraint
            self.heightConstraint = make.height.equalTo(44 * text.count).constraint
        }
        alertTableView.isScrollEnabled = false
        alertTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        _ = delay(0.1) {
            self.bottomConstraint.update(offset: 0)
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                self.alertTableView.alpha = 1
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            }, completion: nil)
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "a")
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = text[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismissVC(actionSheet: .index(row: indexPath.row))
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissVC(actionSheet: .cancel)
    }
    
    fileprivate func dismissVC(actionSheet: YGActionSheet) {
        heightConstraint.update(offset: 30)
        UIView.animate(withDuration: 0.3, animations: {
            self.alertTableView.alpha = 0.4
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.view.layoutIfNeeded()
        }) { (result) in
            if result {
                self.action?(actionSheet)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

public typealias Task = (_ cancel : Bool) -> Void

public func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = { cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
    
}

public func cancel(_ task: Task?) {
    task?(true)
}
