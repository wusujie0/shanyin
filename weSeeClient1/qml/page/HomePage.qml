import VPlayApps 1.0
import QtQuick 2.0
import "../page"

Page {
    id: homePage
    title: qsTr("推荐")
    navigationBarTranslucency: 1.0
    backgroundColor: "lightblue"
    rightBarItem: NavigationBarRow {
        // add new todo
        IconButtonBarItem {
            id:plus
            icon: IconType.plus
            //            showItem: showItemAlways
            onClicked: {


            }
        }

    }
    Column{
        spacing: dp(20)
        anchors.right: parent.right
        anchors.rightMargin: dp(10)
        y:parent.height/2
        Column{
            spacing: dp(1)
            IconButton{
                id: favoriteIcon
                size: dp(25)
                icon: IconType.heart
                color: isFavorite || favoriteArea.pressed ? "red" : "white"

                property bool isFavorite: item && item.id ? dataModel.isFavorite(item.id) : false
                property bool updateWhenVisible: false

                // update UI when favorites change while visible
                //          Connections {
                //            target: dataModel
                //            onFavoritesChanged: {
                //              if(visible)
                //                favoriteIcon.isFavorite = item && item.id ? dataModel.isFavorite(item.id) : false
                //              else
                //                favoriteIcon.updateWhenVisible = true
                //            }
                //          }

                // update UI when favorites changed while invisible
                onVisibleChanged: {
                    if(visible && updateWhenVisible) {
                        favoriteIcon.isFavorite = item && item.id ? dataModel.isFavorite(item.id) : false
                        updateWhenVisible = false
                    }
                }
            }

            Text {
                id: favoriteNum
                text: ""
                color: "white"
                font.pixelSize: dp(15)
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Column{
            spacing: dp(3)
            IconButton{
                id:commentIcon
                icon: IconType.comment
                color: "white"
                size:dp(25)
                onClicked: {
                    commentPage.opacity = 1
                }

            }
            Text {
                id: commentNum
                text: qsTr("")
                color: "white"
                font.pixelSize: dp(15)
                
                
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    CommentPage{
        id:commentPage
        visible: opacity > 0
        enabled: visible
        opacity: 0

        Behavior on opacity {NumberAnimation{duration: 250}}
    }
    Component.onCompleted: {
        commentNum.text = 0                   //从服务器获取喜欢数和评论数
        favoriteNum.text = 0
    }

}
