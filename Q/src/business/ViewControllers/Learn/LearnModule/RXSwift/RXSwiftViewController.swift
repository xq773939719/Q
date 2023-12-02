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
        observablesAndObservers()
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
        let a = Observable.just([:])
        let b = Observable.of([:])
        _ = Observable.combineLatest(a, b)
        return Observable.create { observer in
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
    
    // success(result) | complete | error(error)
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

// MARK: - Observable & Observer

extension RXSwiftViewController {
    
    func observablesAndObservers() {
        // 异步型
        asyncSubject() // 只会抛出订阅后的 最后一个元素与complete
        // 通知型
        publishSubject() // 抛出订阅之后的元素和completed
        // 重复型
        replaySubject() // 缓存bufferSize的元素, 抛出缓存的元素不关心何时订阅
        // 行为型
        behaviorSubject() // 订阅时会发送默认元素，之后与publishSubject类似
        // ControlProperty
    }
    
    func asyncSubject() {
        let disposeBag = DisposeBag()
        let subject = AsyncSubject<String>()

        subject
          .subscribe { print("asyncSubject:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🐶")
        subject.onNext("🐱")
        subject.onNext("🐹")
        subject.onCompleted()
    }
    
    func publishSubject() {
        let disposeBag = DisposeBag()
        let subject = PublishSubject<String>()

        subject
          .subscribe { print("publishSubject 1 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🐶")
        subject.onNext("🐱")

        subject
          .subscribe { print("publishSubject 2 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🅰️")
        subject.onNext("🅱️")
    }
    
    func replaySubject() {
        let disposeBag = DisposeBag()
        let subject = ReplaySubject<String>.create(bufferSize: 10)

        subject
          .subscribe { print("replaySubject 1 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🐶")
        subject.onNext("🐱")

        subject
          .subscribe { print("replaySubject 2 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🅰️")
        subject.onNext("🅱️")
    }
    
    func behaviorSubject() {
        let disposeBag = DisposeBag()
        let subject = BehaviorSubject(value: "🔴")

        subject
          .subscribe { print("behaviorSubject 1 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🐶")
        subject.onNext("🐱")

        subject
          .subscribe { print("behaviorSubject 2 Event:", $0) }
          .disposed(by: disposeBag)

        subject.onNext("🍐")
        subject.onNext("🍊")
    }
    
}

// MARK: - Operator

extension RXSwiftViewController {
    
    // filter/map/zip 等操作符列表 -> 高阶函数
    
}

// MARK: - Disposable

extension RXSwiftViewController {
    
    // ① self.disposable =
    // ② private let disposeBag = DisposeBag()
    // ③ .takeUntil(self.rx.deallocated)
    
    
}


// MARK: - Schedulers

extension RXSwiftViewController {
    
    // .subscribeOn(耗时操作异步线程) 决定构建数据序列在哪个线程
    // .observeOn(工作线程) 决定监听处理序列在哪个线程
    // MainScheduler
    // SerialDispatchQueueScheduler 串行 DispatchQueue, ConcurrentDispatchQueueScheduler 并行 DispatchQueue
    // OperationQueueScheduler
    
}

// MARK: - Error

extension RXSwiftViewController {
    
    // retry
    // retryWhen
    // catchError
    // Result
    
}
