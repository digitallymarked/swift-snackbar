//
//  ViewController.swift
//  SnackBar
//
//  Created by Mark Markov on 2.04.21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(frame: CGRect(x: 20, y: 130, width: view.frame.size.width-40, height: 55))
        button.backgroundColor = .systemRed
        button.setTitle("Show Snackbar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    
    
    @objc private func didTapButton() {
        let viewModel: SnackbarViewModel
        
        viewModel = SnackbarViewModel(type: .info,
                                      text: "Hello World",
                                      image: UIImage(systemName: "bell"))
        let frame = CGRect(x: 0, y: 0, width: view.frame.size.width/1.2, height: 60)
        let snackBar = SnackbarView(viewModel: viewModel, frame: frame)
        showSnackbar(snackBar: snackBar)
    }
    
    public func showSnackbar(snackBar: SnackbarView) {
        let width = view.frame.size.width/1.2
        snackBar.frame = CGRect(x: (view.frame.size.width-width)/2,
                                y: view.frame.size.height,
                                width: width,
                                height: 60)
        view.addSubview(snackBar)
        
        UIView.animate(withDuration: 0.3, animations: {
            snackBar.frame = CGRect(x: (self.view.frame.size.width-width)/2,
                                    y: self.view.frame.size.height - 80,
                                    width: width,
                                    height: 60)
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    UIView.animate(withDuration: 0.3, animations: {
                        
                        snackBar.frame = CGRect(x: (self.view.frame.size.width-width)/2,
                                                y: self.view.frame.size.height,
                                                width: width,
                                                height: 60)
                    }, completion: { finisehd in
                        if finisehd {
                            snackBar.removeFromSuperview()
                        }
                    })
                })
            }
        })
    }
}

