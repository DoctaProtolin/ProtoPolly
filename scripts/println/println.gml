
function println(str) {
    
    if (typeof(str) == "array") {
        var outStr = "";
        for (var i = 0; i < array_length(str); i ++) {
            outStr += " " + string(str[i]);
        }
        show_debug_message(outStr);
        
        return;
    }
    
    show_debug_message(str);
}