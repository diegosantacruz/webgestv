function update_atr(id) {
    jQuery.ajax({
        url: "/update_atr",
        type: "GET",
        data: {"id" : id},
        dataType: "html",
        success: function(data) {
            //alert(data);
            //jQuery("#linksbDiv").HTML(data);
            document.getElementById('atrDiv').innerHTML=data;
        }
    });
}

function refresh_atr(id) {
    jQuery.ajax({
        url: "/refresh_atr",
        type: "GET",
        data: {"id" : id},
        dataType: "html",
        success: function(data) {
            //alert(data);
            //jQuery("#linksbDiv").HTML(data);
            document.getElementById('refreshatrDiv').innerHTML=data;
        }
    });
}