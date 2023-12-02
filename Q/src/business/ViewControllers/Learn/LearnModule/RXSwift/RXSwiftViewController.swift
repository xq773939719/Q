//
//  RXSwift.swift
//  Q
//
//  Created by XQ on 2023/12/1.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RXSwiftViewController : BaseViewController {
    
    private let disposeBag = DisposeBag()
    
    private let button: UIButton = {
        let button: UIButton = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("按钮", for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override class func scheme() -> String {
        return "q://vc/rxswift";
    }
    
    override func setupData() {
        someObservables()
        someObservers()
    }
   
    override func setupViews() {
        super.setupViews();
        self.addSubview(self.button)
        self.button.snp.makeConstraints({ make in
            make.center.equalTo(self.rootContainer)
        })
    }
    
}

// MARK: - Observable

extension RXSwiftViewController {
    
    func someObservables() {
        observeable().subscribe(
            onNext: { result in
                print(result)
            },
            onError: { error in
                print(error)
            },
            onCompleted: {
                print("observeable complete")
            }
        ).disposed(by: disposeBag)
        single().subscribe(
            onSuccess: { result in
                print(result)
            },
            onFailure: { error in
                print(error)
            }
        ).disposed(by: disposeBag)
        
        completable().subscribe(
            onCompleted: {
                print("completable complete")
            },
            onError: { error in
                print(error)
            }
        ).disposed(by: disposeBag)
        
        maybe().subscribe(
            onSuccess: { result in
                print(result)
            },
            onError: { error in
                print(error)
            },
            onCompleted: {
                print("maybe complete")
            }
        ).disposed(by: disposeBag)
    }
    
    // next(value) + complete + error(error)
    func observeable() -> Observable<[String: Any]> {
        Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                for i in 0...10 {
                    observer.onNext(["\(i)": i])
                }
                observer.onCompleted()
            }
            return Disposables.create {
                print("observeable dispose")
            }
        }
    }
    
    // success(result) + error(error)
    func single() -> Single<[String: Any]> {
        return Single.create { single in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                single(.success(["single": 1]))
            }
            return Disposables.create {
                print("single dispose")
            }
        }
    }
    
    // complete + error(error)
    func completable() -> Completable {
        return Completable.create { completable in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                completable(.completed)
            }
            return Disposables.create {
                print("completable dispose")
            }
        }
    }
    
    // success(result) + complete + error(error)
    func maybe() -> Maybe<[String: Any]> {
        return Maybe.create { maybe in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                maybe(.success(["maybe": 1]))
            }
            return Disposables.create {
                print("completable dispose")
            }
        }
    }
    
    // Driver 同步当前状态
    // Signal 不同步状态，只能拿到订阅之后的状态
    // [状态序列]我们会选用 Driver 这个类型，[事件序列]我们会选用 Signal 这个类型。
    // ControlEvent 专门用于描述 UI 控件所产生的事件
    
}

// MARK: - Observer

extension RXSwiftViewController {
    
    func someObservers() {
        anyObserver()
        self.button.rx.controlEvent(.touchUpInside).subscribe { [weak self] _ in
            self?.bind()
        }.disposed(by: disposeBag)
    }
    
    // ① subscribe + onNext/onError/onComplete
    func anyObserver() {
        let observer: AnyObserver<String> = AnyObserver { (event) in
            switch event {
            case .next(let result):
                print(result)
            case .error(let error):
                print(error)
            case .completed:
                print("anyObserver completed")
            }
        }
        let observable: Observable<String> = Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                for i in 0...10 {
                    observer.onNext("\(i)")
                }
                observer.onCompleted()
            }
            return Disposables.create {
                print("anyObserver dispose")
            }
        }
        observable
            .subscribe(observer)
            .disposed(by: disposeBag)

    }
    
    // ② bind
    func bind() {
        let observable: Observable<String> = Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0) {
                let range = Range(uncheckedBounds: (0, 500))
                observer.onNext("\(Int.random(in: range))")
                observer.onCompleted()
            }
            return Disposables.create {
                print("bind dispose")
            }
        }
        observable
            .bind(to: button.rx.text)
            .disposed(by: disposeBag)
    }
    
}

extension Reactive where Base: UILabel {
  public var text: Binder<String?> {
      return Binder(self.base) { label, text in
          label.text = text
          print("Label文本: ", label.text ?? "")
      }
  }
}

extension Reactive where Base: UIButton {
  public var text: Binder<String?> {
      return Binder(self.base) { button, text in
          button.setTitle(text, for: .normal)
          print("Button文本: ", button.currentTitle ?? "")
      }
  }
}
