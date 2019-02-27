import QtQuick 2.5
import VPlayApps 1.0
import "../model"

Rectangle {
    id: sexPicker
    color: "#fff"
    clip: true
    property int numberOfItems: 7
    property string fontFamily

    property string sex2
    Rectangle {
        width: parent.width
        height: 1
        y: (parent.height - listView.delegateHeight) / 2
        color: "#D0D0D0"
    }
    Rectangle {
        width: parent.width
        height: 1
        y: (parent.height - listView.delegateHeight) / 2 + listView.delegateHeight
        color: "#D0D0D0"
    }

    ListView{
        id:sexListView
        width:parent.width
        //        y:-parent.height * 0.5
        height: parent.height * 2
        model: SexModel{}
        focus: true
        delegate:Component{
            id:sexListViewDelegate
            Text {
                font.pixelSize: dp(20)
                text: sex
                anchors.horizontalCenter: parent.horizontalCenter
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        sexListView.currentIndex = index
                        sex2 = sexListView.currentIndex.valueOf()
                    }
                }
            }
        }
        highlight: Rectangle {
            color: "red"
        }
    }

    Component.onCompleted: {                        //需要从读取sex的设置
        if(sex2 === '男'){
            sexListView.currentIndex = 0
        }
        else if(sex2 === '女'){
            sexListView.currentIndex = 1
        }
        else{
            sexListView.currentIndex = 2
        }
    }
}
