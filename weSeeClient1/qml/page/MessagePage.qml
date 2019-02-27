import VPlayApps 1.0
import QtQuick 2.4
import "../page"

ListPage{

    id:messagePage
    title: "消息"

    emptyText.text: qsTr("没有消息")

    delegate: SimpleRow{
        image.radius: image.height
        image.fillMode: Image.PreserveAspectCrop
        autoSizeImage: true
        style.showDisclosure: false
        imageMaxSize: dp(48)
        detailTextItem.maximumLineCount: 1
        detailTextItem.elide: Text.ElideRight

        onSelected: {
          messagePageStack.popAllExceptFirstAndPush(detailPageComponent,{
                                                        person:item.text,
                                                        newMsgs: [{me:true,text:item.detailText}]
                                                    })
        }

    }

    //当有好友发消息来时更新界面
//    Connections{
//        target: ""           //
//    }

    Component{id:detailPageComponent; ConversationPage{}}

}
