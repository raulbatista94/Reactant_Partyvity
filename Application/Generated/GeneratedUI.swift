// Generated from /Users/raul/Desktop/reactant_activity/Application/Sources/Styles/General.styles.xml
import UIKit
import Reactant
import SnapKit
#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
import ReactantLiveUI
#endif

struct GeneralStyles {
    static func controllerRootView(_ view: UIView) {
        view.backgroundColor = UIColor.white
    }
}
import UIKit
import Reactant
import SnapKit
#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
import ReactantLiveUI
#endif
import Reactant
import UIKit
// Generated from /Users/raul/Desktop/reactant_activity/Application/Sources/Components/Main/MainRootView.ui.xml
extension MainRootView: ReactantUI, RootView {
    var edgesForExtendedLayout: UIRectEdge {
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
        return ReactantLiveUIManager.shared.extendedEdges(of: self)
        #else
        return []
        #endif
    }
    
    var rui: MainRootView.RUIContainer {
        return Reactant.associatedObject(self, key: &MainRootView.RUIContainer.associatedObjectKey) {
            return MainRootView.RUIContainer(target: self)
        }
    }
    
    var __rui: Reactant.ReactantUIContainer {
        return rui
    }
    
    final class RUIContainer: Reactant.ReactantUIContainer {
        fileprivate static var associatedObjectKey = 0 as UInt8
        
        var xmlPath: String {
            return "/Users/raul/Desktop/reactant_activity/Application/Sources/Components/Main/MainRootView.ui.xml"
        }
        
        var typeName: String {
            return "MainRootView"
        }
        
        let constraints = MainRootView.LayoutContainer()
        
        private weak var target: MainRootView?
        
        fileprivate init(target: MainRootView) {
            self.target = target
        }
        
        func setupReactantUI() {
            guard let target = self.target else { /* FIXME Should we fatalError here? */ return }
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
            ReactantLiveUIManager.shared.register(target) {
                _, _ in
                return false
            }
            #else
            target.addSubview(target.teamTableView)
            
            target.teamTableView.snp.makeConstraints {
                make in
                make.left.equalTo(target)
                make.right.equalTo(target)
                make.top.equalTo(target)
                make.bottom.equalTo(target)
            }
            #endif
        }
        
        static func destroyReactantUI(target: UIView) {
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
            guard let knownTarget = target as? MainRootView else { /* FIXME Should we fatalError here? */ return }
            ReactantLiveUIManager.shared.unregister(knownTarget)
            #endif
        }
    }
    
    final class LayoutContainer {
    }
    struct Styles {
    }
}
// Generated from /Users/raul/Desktop/reactant_activity/Application/Sources/Components/Main/TeamCell.ui.xml
extension TeamCell: ReactantUI {
    
    var rui: TeamCell.RUIContainer {
        return Reactant.associatedObject(self, key: &TeamCell.RUIContainer.associatedObjectKey) {
            return TeamCell.RUIContainer(target: self)
        }
    }
    
    var __rui: Reactant.ReactantUIContainer {
        return rui
    }
    
    final class RUIContainer: Reactant.ReactantUIContainer {
        fileprivate static var associatedObjectKey = 0 as UInt8
        
        var xmlPath: String {
            return "/Users/raul/Desktop/reactant_activity/Application/Sources/Components/Main/TeamCell.ui.xml"
        }
        
        var typeName: String {
            return "TeamCell"
        }
        
        let constraints = TeamCell.LayoutContainer()
        
        private weak var target: TeamCell?
        
        fileprivate init(target: TeamCell) {
            self.target = target
        }
        
        func setupReactantUI() {
            guard let target = self.target else { /* FIXME Should we fatalError here? */ return }
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
            ReactantLiveUIManager.shared.register(target) {
                _, _ in
                return false
            }
            #else
            target.icon.font = UIFont.systemFont(ofSize: 40.0, weight: UIFont.Weight.bold)
            target.icon.clipsToBounds = true
            target.addSubview(target.icon)
            
            target.name.numberOfLines = 1
            target.name.textColor = UIColor(red: 0.16078431372549, green: 0.32156862745098, blue: 0.63921568627451, alpha: 1.0)
            target.name.font = UIFont.systemFont(ofSize: 26.0, weight: UIFont.Weight.bold)
            target.addSubview(target.name)
            
            target.addSubview(target.score)
            
            target.addSubview(target.round)
            
            target.icon.snp.makeConstraints {
                make in
                make.centerY.equalTo(target)
                make.leading.equalTo(target).offset(11.0)
            }
            target.name.snp.makeConstraints {
                make in
                make.top.equalTo(target).offset(8.0)
                make.leading.equalTo(target.icon).offset(55.0)
            }
            target.score.snp.makeConstraints {
                make in
                make.top.equalTo(target.name.snp.bottom).offset(4.0)
                make.bottom.equalTo(target).offset(-6.0)
                make.leading.equalTo(target.icon).offset(55.0)
            }
            target.round.snp.makeConstraints {
                make in
                make.leading.equalTo(target.score).offset(80.0)
                make.top.equalTo(target.score)
                make.bottom.equalTo(target.score)
                make.trailing.lessThanOrEqualTo(target)
            }
            #endif
        }
        
        static func destroyReactantUI(target: UIView) {
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
            guard let knownTarget = target as? TeamCell else { /* FIXME Should we fatalError here? */ return }
            ReactantLiveUIManager.shared.unregister(knownTarget)
            #endif
        }
    }
    
    final class LayoutContainer {
    }
    struct Styles {
    }
}
// Generated from /Users/raul/Desktop/reactant_activity/Application/Sources/Components/Main/GameRootView.ui.xml
extension GameRootView: ReactantUI {
    
    var rui: GameRootView.RUIContainer {
        return Reactant.associatedObject(self, key: &GameRootView.RUIContainer.associatedObjectKey) {
            return GameRootView.RUIContainer(target: self)
        }
    }
    
    var __rui: Reactant.ReactantUIContainer {
        return rui
    }
    
    final class RUIContainer: Reactant.ReactantUIContainer {
        fileprivate static var associatedObjectKey = 0 as UInt8
        
        var xmlPath: String {
            return "/Users/raul/Desktop/reactant_activity/Application/Sources/Components/Main/GameRootView.ui.xml"
        }
        
        var typeName: String {
            return "GameRootView"
        }
        
        let constraints = GameRootView.LayoutContainer()
        
        private weak var target: GameRootView?
        
        fileprivate init(target: GameRootView) {
            self.target = target
        }
        
        func setupReactantUI() {
            guard let target = self.target else { /* FIXME Should we fatalError here? */ return }
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
            ReactantLiveUIManager.shared.register(target) {
                _, _ in
                return false
            }
            #else
            let temp_ImageView_1 = UIImageView()
            temp_ImageView_1.image = UIImage(named: "background")
            target.addSubview(temp_ImageView_1)
            
            let temp_View_2 = UIView()
            temp_View_2.backgroundColor = UIColor(red: 0.901960784313726, green: 0.901960784313726, blue: 0.901960784313726, alpha: 1.0)
            target.addSubview(temp_View_2)
            
            target.name.textColor = UIColor.black
            target.name.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
            target.addSubview(target.name)
            
            target.actualActivity.textColor = UIColor.black
            target.actualActivity.font = UIFont.systemFont(ofSize: 28.0, weight: UIFont.Weight.bold)
            target.addSubview(target.actualActivity)
            
            target.wordLabel.textColor = UIColor.black
            target.wordLabel.font = UIFont.systemFont(ofSize: 40.0, weight: UIFont.Weight.bold)
            target.addSubview(target.wordLabel)
            
            target.timer.textColor = UIColor.black
            target.timer.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
            target.addSubview(target.timer)
            
            let temp_Container_3 = ContainerView()
            target.addSubview(temp_Container_3)
            
            target.button3Points.apply(style: Styles.BlueButton)
            temp_Container_3.addSubview(target.button3Points)
            
            target.button4Points.apply(style: Styles.BlueButton)
            temp_Container_3.addSubview(target.button4Points)
            
            target.button5Points.apply(style: Styles.BlueButton)
            temp_Container_3.addSubview(target.button5Points)
            
            target.startButton.apply(style: Styles.BlueButton)
            target.startButton.layer.cornerRadius = 20.0
            target.startButton.setBackgroundColor(UIColor.blue, for: [])
            target.startButton.setTitle("START", for: [])
            target.addSubview(target.startButton)
            
            target.correctButton.apply(style: Styles.BlueButton)
            target.correctButton.setBackgroundColor(UIColor(red: 0.16078431372549, green: 0.63921568627451, blue: 0.16078431372549, alpha: 1.0), for: [])
            target.correctButton.setTitle("Correct", for: [])
            target.addSubview(target.correctButton)
            
            target.incorrectButton.apply(style: Styles.BlueButton)
            target.incorrectButton.setBackgroundColor(UIColor.red, for: [])
            target.incorrectButton.setTitle("Incorrect", for: [])
            target.addSubview(target.incorrectButton)
            
            temp_ImageView_1.snp.makeConstraints {
                make in
                make.left.equalTo(target)
                make.right.equalTo(target)
                make.top.equalTo(target)
                make.bottom.equalTo(target)
            }
            temp_View_2.snp.makeConstraints {
                make in
                make.left.equalTo(target)
                make.right.equalTo(target)
                make.height.equalTo(1.0)
                make.bottom.equalTo(target)
            }
            target.name.snp.makeConstraints {
                make in
                make.centerX.equalTo(target)
                make.top.equalTo(target).offset(8.0)
            }
            target.actualActivity.snp.makeConstraints {
                make in
                make.centerX.equalTo(target)
                make.top.equalTo(target.name.snp.bottom).offset(15.0)
            }
            target.wordLabel.snp.makeConstraints {
                make in
                make.centerX.equalTo(target)
                make.top.equalTo(target.actualActivity.snp.bottom).offset(30.0)
            }
            target.timer.snp.makeConstraints {
                make in
                make.centerX.equalTo(target)
                make.top.equalTo(target.actualActivity.snp.bottom).offset(130.0)
            }
            temp_Container_3.snp.makeConstraints {
                make in
                make.centerX.equalTo(target)
                make.trailing.greaterThanOrEqualTo(target).offset(-35.0)
                make.top.equalTo(target)
                make.bottom.equalTo(target)
            }
            target.button3Points.snp.makeConstraints {
                make in
                make.top.equalTo(target.actualActivity.snp.bottom).offset(70.0)
                make.height.equalTo(90.0)
                make.leading.equalTo(temp_Container_3).offset(15.0)
                make.width.equalTo(70.0)
            }
            target.button4Points.snp.makeConstraints {
                make in
                make.width.equalTo(target.button3Points)
                make.height.equalTo(target.button3Points)
                make.top.equalTo(target.button3Points)
                make.leading.equalTo(target.button3Points.snp.trailing).offset(35.0)
            }
            target.button5Points.snp.makeConstraints {
                make in
                make.width.equalTo(target.button3Points)
                make.height.equalTo(target.button3Points)
                make.top.equalTo(target.button4Points)
                make.trailing.equalTo(temp_Container_3).offset(-15.0)
                make.leading.equalTo(target.button4Points.snp.trailing).offset(35.0)
            }
            target.startButton.snp.makeConstraints {
                make in
                make.top.equalTo(target.button4Points.snp.bottom).offset(50.0)
                make.centerX.equalTo(target)
                make.height.equalTo(60.0)
                make.width.equalTo(190.0)
            }
            target.correctButton.snp.makeConstraints {
                make in
                make.height.equalTo(50.0)
                make.bottom.equalTo(target.incorrectButton)
                make.left.equalTo(target).offset(30.0)
                make.width.equalTo(100.0)
            }
            target.incorrectButton.snp.makeConstraints {
                make in
                make.height.equalTo(50.0)
                make.right.equalTo(target).offset(-30.0)
                make.bottom.equalTo(target).offset(-30.0)
                make.width.equalTo(100.0)
            }
            #endif
        }
        
        static func destroyReactantUI(target: UIView) {
            #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
            guard let knownTarget = target as? GameRootView else { /* FIXME Should we fatalError here? */ return }
            ReactantLiveUIManager.shared.unregister(knownTarget)
            #endif
        }
    }
    
    final class LayoutContainer {
    }
    struct Styles {
        static func BlueButton(_ view: UIButton) {
            view.layer.cornerRadius = 15.0
            view.setBackgroundColor(UIColor.darkGray, for: [])
            view.clipsToBounds = true
        }
    }
}
#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
struct GeneratedReactantLiveUIConfiguration: ReactantLiveUIConfiguration {
    let rootDir = "/Users/raul/Desktop/reactant_activity/Application/Sources"
    let commonStylePaths: [String] = [
        "/Users/raul/Desktop/reactant_activity/Application/Sources/Styles/General.styles.xml",
    ]
    let componentTypes: [String: UIView.Type] = [
        "TeamCell": TeamCell.self,
        "GameRootView": GameRootView.self,
        "MainRootView": MainRootView.self,
    ]
}
#endif
func activateLiveReload(in window: UIWindow) {
#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(tvOS))
ReactantLiveUIManager.shared.activate(in: window, configuration: GeneratedReactantLiveUIConfiguration())
#endif
}
