/**
 * 
 */


function OnChange(dropdown, id)
{
    var myindex  = dropdown.selectedIndex;
    var value = dropdown.options[myindex].value;
    if(id == 'college'){
    	var a = '<t:departmentsdd collegeid="1"></t:departmentsdd>';
    	//a = a.concat(value);
    	//a = a.concat('"></t:departmentsdd>');
    	document.getElementById('department').innerHTML = a; 
    }
}