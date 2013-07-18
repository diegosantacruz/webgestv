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

function update_cond(id) {

    jQuery.ajax({
        url: "/update_cond",
        type: "GET",
        data: {"id" : id},
        dataType: "html",
        success: function(data) {
            //alert(data);
            //jQuery("#linksbDiv").HTML(data);
            document.getElementById('updatecondDiv').innerHTML=data;
            return data;
        }
    });
}


function verificar(param)

{      var retorno= update_cond(param);
       newdiv = document.createElement('div');
       document.getElementById('campos').appendChild(newdiv);
       newInput = document.createElement("input");
       newInput2 = document.createElement("input");
       newInput.type='text';
       newInput2.type='button', value='filtrar';

       newdiv.setAttribute('id',retorno);
       newdiv.appendChild(newInput);
       newdiv.appendChild(newInput2);
}

//function buscar()
