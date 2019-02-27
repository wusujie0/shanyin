import VPlayApps 1.0
import QtQuick 2.5
import "../controls"

ListPage {
    title: "地区"

    model: [

        {text:"国家",color:"white",dialog:countryPickerDialog},
        {text:"城市",color:"white",dialog:cityPickerDialog},
    ]

    onItemSelected: {
            model[index].dialog.open()    //打开dialog

    }

   CityPickerDialog{id:cityPickerDialog}
   CountryPickerDialog{id:countryPickerDialog}

}
