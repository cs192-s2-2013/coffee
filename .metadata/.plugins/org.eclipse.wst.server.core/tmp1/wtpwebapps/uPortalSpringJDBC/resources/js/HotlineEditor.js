function Add(){
    $("#tblData tbody").append(
        "<tr>"+
        "<td><input type='text' size=1/></td>"+
        "<td><input type='text'/></td>"+
        "<td><input type='text'/ size=20></td>"+
        "<td><button class='btnSave'>Save</button> <button class='btnDelete'>Delete</button></td>"+
        "</tr>");
     
    $(".btnSave").bind("click", Save);     
    $(".btnDelete").bind("click", Delete);
    $("#status").html("");
};

function Save(){
    var par = $(this).parent().parent(); //tr
    var tdID = par.children("td:nth-child(1)");
    var tdName = par.children("td:nth-child(2)");
    var tdInfo = par.children("td:nth-child(3)");
    var tdButtons = par.children("td:nth-child(4)");
 
    tid = tdID.children("input[type=text]").val();
    tname = tdName.children("input[type=text]").val();
    tinfo = tdInfo.children("input[type=text]").val();
    
    if (tid=="" || tname=="" || tinfo==""){
    	alert('Please complete the fields.');
    	return;
    }
    
  //update database
    $.ajax({  
    	type: 'GET',
        url : 'hotline_update',
        data: ({id: tid, name: tname, info: tinfo}),
        success: function(r){$("#status").html("&nbsp&nbsp&nbsp&nbspSuccessfully updated.");},
        //error: function(e){alert(e);}
       });
    
    tdID.html(tdID.children("input[type=text]").val());
    tdName.html(tdName.children("input[type=text]").val());
    tdInfo.html(tdInfo.children("input[type=text]").val());
    tdButtons.html("<button class='btnEdit'>Edit</button> <button class='btnDelete'>Delete</button>");
    $(".btnEdit").bind("click", Edit);
    $(".btnDelete").bind("click", Delete);
    //history.go(0);
    //window.location.reload(true);
    window.location.href = "AdminPage#tab-5";
    //window.location = window.location;
};

function Delete(){
    var par = $(this).parent().parent(); //tr
    var tdID = par.children("td:nth-child(1)");
    tid = tdID.html();
    //tid = tdID.children("input[type=text]").val();
    $.ajax({  
    	type: 'GET',
        url : 'hotline_delete',
        data: ({id: tid}),
        success: function(r){$("#status").html("&nbsp&nbsp&nbsp&nbspHotline "+ tid +" removed.");},
        //error: function(e){alert(tid);}
       });
    par.remove();
};

function Edit(){
    var par = $(this).parent().parent(); //tr
    var tdID = par.children("td:nth-child(1)");
    var tdName = par.children("td:nth-child(2)");
    var tdInfo = par.children("td:nth-child(3)");
    var tdButtons = par.children("td:nth-child(4)");

    tid = tdID.html();

    tdID.html("<input type='text' size=5 id='txtID' value='"+tdID.html()+"'/>");
    tdName.html("<input type='text' id='txtName' value='"+tdName.html()+"'/>");
    tdInfo.html("<input type='text' id='txtInfo' value='"+tdInfo.html()+"'/>");
    tdButtons.html("<button class='btnSave'>Save</button>");
    
    $.ajax({  
    	type: 'GET',
        url : 'hotline_delete',
        data: ({id: tid}),
        success: function(r){$("#status").html("&nbsp&nbsp&nbsp&nbspEditing");},
        error: function(e){alert(e);}
       });
 
    $(".btnSave").bind("click", Save);
    $(".btnEdit").bind("click", Edit);
    $(".btnDelete").bind("click", Delete);
    $("#status").html("");
};

$(function(){
    //Add, Save, Edit and Delete functions code
    $(".btnEdit").bind("click", Edit);
    $(".btnDelete").bind("click", Delete);
    $("#btnAdd").bind("click", Add);
});