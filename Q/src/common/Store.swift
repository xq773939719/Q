//
//  Store.swift
//
//  Created by XQ on 2023/12/13.
//

import Foundation

public protocol QServiceLifeCycle {
    func onStart()
    func onPause()
    func onResume()
    func onStop()
}

extension QServiceLifeCycle {
    public func onStart() {}
    public func onPause() {}
    public func onResume() {}
    public func onStop() {}
}

public class QService: NSObject, QServiceLifeCycle {
    
    public weak var store: QServiceStore?
    
    public required init(store: QServiceStore?) {
        super.init()
        self.store = store
    }
    
    deinit {

    }
    
    public func resolve<T: QService>(_ serviceType: T.Type) -> T {
        guard let store = store else {
            let service = serviceType.init(store: nil)
            return service
        }
        return store.resolve(serviceType)
    }
    
    public func optional<T: QService>(_ serviceType: T.Type) -> T? {
        return store?.optional(serviceType)
    }
}

public class QServiceStore {
    
    final class RecursiveLock: NSLocking {
        public init() {
            pthread_mutexattr_init(&recursiveMutexAttr)
            pthread_mutexattr_settype(&recursiveMutexAttr, PTHREAD_MUTEX_RECURSIVE)
            pthread_mutex_init(&recursiveMutex, &recursiveMutexAttr)
        }
        
        @inline(__always)
        final public func lock() {
            pthread_mutex_lock(&recursiveMutex)
        }
        
        @inline(__always)
        final public func unlock() {
            pthread_mutex_unlock(&recursiveMutex)
        }
        private var recursiveMutex = pthread_mutex_t()
        private var recursiveMutexAttr = pthread_mutexattr_t()
    }

    
    typealias StoreLock = RecursiveLock
    typealias ServiceTable = [String: QService]
    
    private let lock: StoreLock = StoreLock()
    private lazy var serviceTable: ServiceTable = [:]

    public required init() {

    }
    
    deinit {
        
    }
    
    public func reset() {
        lock.lock()
        defer { lock.unlock() }
        serviceTable.removeAll()
    }
}

extension QServiceStore {
    
    @discardableResult
    private func createService<T: QService>(_ serviceType: T.Type, bind: Bool = true) -> T {
        if let existBloc = lookupService(serviceType) {
            return existBloc
        }
        let service = serviceType.init(store: self)
        if bind {
            bindService(service)
        }
        return service
    }

    @discardableResult
    public func resolve<T: QService>(_ serviceType: T.Type) -> T {
        return createService(serviceType)
    }
    
    public func optional<T: QService>(_ serviceType: T.Type) -> T? {
        return lookupService(serviceType)
    }
    
}

extension QServiceStore {
    
    public func lookupService<T: QService>(_ serviceType: T.Type) -> T? {
        let serviceTypeKey = "\(serviceType)"
        lock.lock()
        defer { lock.unlock() }
        return serviceTable[serviceTypeKey] as? T
    }
    
}

extension QServiceStore {
    
    public func bindService<T: QService>(_ serviceType: T.Type) {
        let serviceTypeKey = "\(serviceType)"
        guard let service = lookupService(serviceType) else {
            return
        }
        bindService(service)
    }
    
    public func bindService<T: QService>(_ service: T) {
        let serviceTypeKey = "\(type(of: service.self))"

        lock.lock()
        serviceTable[serviceTypeKey] = service
        service.onStart()
        lock.unlock()
    }
    
    public func unbindService<T: QService>(_ serviceType: T.Type) {
        let serviceTypeKey = "\(serviceType)"
        guard let service = lookupService(serviceType) else {
            return
        }
        unbindService(service)
    }
    
    public func unbindService<T: QService>(_ service: T) {
        let serviceTypeKey = "\(type(of: service.self))"

        lock.lock()
        serviceTable[serviceTypeKey] = nil
        service.onStop()
        lock.unlock()
    }
    
}

extension QServiceStore {

    public func enumerated<T: QService>(_ serviceType: T.Type = QService.self, element: (T) -> Void) {
        for v in allServices(serviceType) { element(v) }
    }

    public func allServices<T: QService>(_ serviceType: T.Type = QService.self) -> [T] {
        lock.lock()
        defer { lock.unlock() }
        return serviceTable.values.compactMap({ $0 as? T })
    }
    
}
