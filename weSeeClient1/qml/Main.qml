import VPlayApps 1.0
import QtQuick 2.0
import "page"

App {
    // You get free licenseKeys from https://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"
    

    Navigation {
        id: navigation
        // first tab
        NavigationItem {
            title: qsTr("首页")

            NavigationStack {
                    splitView: tablet // use side-by-side view on tablets
                    initialPage: HomePage {}
            }
        }

        //second tab
        NavigationItem{
            id:friend
            title:qsTr("好友")

            NavigationStack {
                splitView: tablet // use side-by-side view on tablets
                initialPage: FriendPage {}
            }

        }


        //third tab

        //forth tab
        NavigationItem{
            title: qsTr("消息")

            NavigationStack {
                id:messagePageStack
                splitView: tablet // use side-by-side view on tablets
                initialPage: MessagePage {}
            }
        }

        // fifth tab
        NavigationItem {
            title: qsTr("我") // use qsTr for strings you want to translate
            NavigationStack {
                splitView: tablet // use side-by-side view on tablets
                initialPage: MePage {}
            }
        }

    }
    onInitTheme: {
        Theme.tabBar.backgroundColor = "lightblue"
        Theme.tabBar.textSize = dp(15)
        Theme.navigationBar.titleColor = "white"
        Theme.navigationBar.backgroundColor = "lightblue"
        Theme.navigationBar.titleTextSize = dp(20)

    }
}
