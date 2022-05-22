function set_show_citizenship_input(val){
    var element=document.getElementById('citizenship_input');
    if (val=="other"){
        element.style.display='';
        element.value='';
    }
    else{
        // Make sure input has value when hidden
        element.style.display='none';
        element.value=val;
    }
}

// Fixes bug where citizenship_input shows on page reload
set_show_citizenship_input(document.getElementById('citizenship_select').value);
