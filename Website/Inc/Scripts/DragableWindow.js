﻿function jstrprintf() {
    len = arguments.length;
    if (len == 0) { return; }
    if (len == 1) { return arguments[0]; }

    var result;
    var regexstr;
    var replstr;
    var formatstr;
    var re;

    result = "";
    regexstr = "";
    replstr = "";
    formatstr = arguments[0];

    for (var i = 1; i < arguments.length; i++) {
        replstr += String(i + 100) + arguments[i] + String(i + 100);
        regexstr += String(i + 100) + "(.*)" + String(i + 100);
    }
    re = new RegExp(regexstr);
    var result;
    result = replstr.replace(re, formatstr);
    return result;
}

function AddPx(num) {
    return String(num) + "px";
}

function findParentDiv(obj) {
    while (obj) {
        if (obj.tagName.toUpperCase() == "DIV") {
            return obj;
        }

        if (obj.parentElement) {
            obj = obj.parentElement;
        }
        else {
            return null;
        }
    }
    return null;
}

function findParentTagById(obj, parentname) {
    while (obj) {
        if (obj.id.match(parentname)) {
            return obj;
        }

        if (obj.parentElement) {
            obj = obj.parentElement;
        }
        else {
            return null;
        }
    }
    return null;
}

// Now for the real thing

var topZ = 1;
var startX;
var startY;
startX = 750;
startY = 150;
nextID = 1;

function CreateDropdownWindow(caption, theWidth, canMove, contentSource) {
    var newdiv;
    newdiv = document.createElement("div");
    newdiv.id = "dragTitle" + String(nextID);
    newdiv.className = "divDragTitle";
    newdiv.style.width = theWidth;
    newdiv.style.left = AddPx(startX);
    newdiv.style.top = AddPx(startY);
    newdiv.style.zIndex = topZ;
    newdiv.innerHTML = jstrprintf(
        '<table><tr>' +
        '<td style="text-align:left">' +
        '<img src="/SBS/images/buttontop.gif" class="divTitleButton" id="dragButton$2" ' +
        'onmousedown="javascript:toggleContentWin($2)" /></td><td>$1</td>' +
        '<td style="text-align:right">' + '<img src="/SBS/images/cancel.png" class="divTitleButton" id="dragButton$3" onClick="javascript:closeMe()" />' + '</td>' +
        '</tr></table>',caption, nextID);
        

    // If canMove is false, don't register event handlers
    if (canMove) {
        // IE doesn't support addEventListener, so check for its presence
        if (newdiv.addEventListener) {
            // firefox, etc.
            newdiv.addEventListener("mousemove", function(e) { return mouseMove(e) }, true);
            newdiv.addEventListener("mousedown", function(e) { return mouseDown(e) }, true);
            newdiv.addEventListener("mouseup", function(e) { return mouseUp(e) }, true);
        }
        else {
            // IE
            newdiv.attachEvent("onmousemove", function(e) { return mouseMove(e) });
            newdiv.attachEvent("onmousedown", function(e) { return mouseDown(e) });
            newdiv.attachEvent("onmouseup", function(e) { return mouseUp(e) });
        }
    }
    document.body.appendChild(newdiv);

    var newdiv2;
    newdiv2 = document.createElement("div");
    newdiv2.id = "dragContent" + String(nextID);
    newdiv2.className = "divDragContent";
    newdiv2.style.width = theWidth;
    newdiv2.style.left = AddPx(startX);
    newdiv2.style.top = AddPx(startY + 20);
    newdiv2.style.zIndex = topZ;
    if (contentSource) {
        newdiv2.innerHTML = document.getElementById(contentSource).innerHTML;
    }

    if (canMove) {
        if (newdiv2.addEventListener) {
            // firefox, etc.
            newdiv2.addEventListener("mousedown", function(e) { return contentMouseDown(e) }, true);
        }
        else {
            // IE
            newdiv2.attachEvent("onmousedown", function(e) { return contentMouseDown(e) });
        }
    }
    document.body.appendChild(newdiv2);

    // Save away the content DIV into the title DIV for 
    // later access, and vice versa
    newdiv.content = newdiv2;
    newdiv2.titlediv = newdiv;

    topZ += 1;
    startX += 25;
    startY += 25;
    // If you want you can check when these two are greater than
    // a certain number and then rotate them back to 100,100...

    nextID++;
}

function toggleContentWin(id) {
    var elem = document.getElementById("dragContent" + String(id));
    var img = document.getElementById("dragButton" + String(id));

    if (elem.style.display == "none") {
        // hidden, so unhide
        elem.style.display = "block";

        // Change the button's image
        img.src = "/SBS/images/buttontop.gif";
    }
    else {
        // showing, so hide
        elem.style.display = "none";

        // Change the button's image
        img.src = "/SBS/images/buttonbottom.gif";
    }
}

function closeWindow(source) {
    debugger;
    var divtitle=document.getElementById('dragTitle1');
    var divcontent = document.getElementById('dragContent1');
    
  
   
    if(divtitle.style.display=="block" || divtitle.style.display==""){
        divtitle.style.display = 'none';  
    }
   if(divcontent.style.display=="block" || divcontent.style.display==""){
     divcontent.style.display = 'none';
    }
  
  
  //  document.getElementById('dragTitle1').style.visibility = 'hidden';
  //  document.getElementById('dragContent1').style.visibility = 'hidden';


}
function closeMe() {

   
    var divtitle = document.getElementById('dragTitle1');
    var divcontent = document.getElementById('dragContent1');



    if (divtitle.style.display == "block" || divtitle.style.display == "") {
        divtitle.style.display = 'none';
    }
    if (divcontent.style.display == "block" || divcontent.style.display == "") {
        divcontent.style.display = 'none';
    } 
    
}


// Drag methods
var dragObjTitle = null;
var dragOffsetX = 0;
var dragOffsetY = 0;

function contentMouseDown(e) {
    // Move the window to the front
    // Use a handy trick for IE vs FF
    var dragContent = e.srcElement || e.currentTarget;
    if (!dragContent.id.match("dragContent")) {
        dragContent = findParentTagById(dragContent, "dragContent");
    }
    if (dragContent) {
        dragContent.style.zIndex = topZ;
        dragContent.titlediv.style.zIndex = topZ;
        topZ++;
    }
}

function mouseDown(e) {
    // These first two lines are written to handle both FF and IE
    var curElem = e.srcElement || e.target;
    var dragTitle = e.currentTarget || findParentDiv(curElem);
    if (dragTitle) {
        if (dragTitle.className != 'divDragTitle') {
            return;
        }
    }

    // Start the drag, but first make sure neither is null
    if (curElem && dragTitle) {

        // Attach the document handlers. We don't want these running all the time.
        addDocumentHandlers(true);

        // Move this window to the front.
        dragTitle.style.zIndex = topZ;
        dragTitle.content.style.zIndex = topZ;
        topZ++;

        // Check if it's the button. If so, don't drag.
        if (curElem.className != "divTitleButton") {

            // Save away the two objects
            dragObjTitle = dragTitle;

            // Calculate the offset
            dragOffsetX = e.clientX -
                dragTitle.offsetLeft;
            dragOffsetY = e.clientY -
                dragTitle.offsetTop;

            // Don't let the default actions take place
            if (e.preventDefault) {
                e.preventDefault();
            }
            else {
                document.onselectstart = function() { return false; };
                e.cancelBubble = true;
                return false;
            }
        }
    }
}

function mouseMove(e) {
    // If not null, then we're in a drag
    if (dragObjTitle) {

        if (!e.preventDefault) {
            // This is the IE version for handling a strange
            // problem when you quickly move the mouse
            // out of the window and let go of the button.
            if (e.button == 0) {
                finishDrag(e);
                return;
            }
        }

        dragObjTitle.style.left = AddPx(e.clientX - dragOffsetX);
        dragObjTitle.style.top = AddPx(e.clientY - dragOffsetY);
        dragObjTitle.content.style.left = AddPx(e.clientX - dragOffsetX);
        dragObjTitle.content.style.top = AddPx(e.clientY - dragOffsetY + 20);
        if (e.preventDefault) {
            e.preventDefault();
        }
        else {
            e.cancelBubble = true;
            return false;
        }
    }
}

function mouseUp(e) {
    if (dragObjTitle) {
        finishDrag(e);
    }
}

function finishDrag(e) {
    var finalX = e.clientX - dragOffsetX;
    var finalY = e.clientY - dragOffsetY;
    if (finalX < 0) { finalX = 0 };
    if (finalY < 0) { finalY = 0 };

    dragObjTitle.style.left = AddPx(finalX);
    dragObjTitle.style.top = AddPx(finalY);
    dragObjTitle.content.style.left = AddPx(finalX);
    dragObjTitle.content.style.top = AddPx(finalY + 20);

    // Done, so reset to null
    dragObjTitle = null;
    addDocumentHandlers(false);
    if (e.preventDefault) {
        e.preventDefault();
    }
    else {
        document.onselectstart = null;
        e.cancelBubble = true;
        return false;
    }
}

function addDocumentHandlers(addOrRemove) {
    if (addOrRemove) {
        if (document.body.addEventListener) {
            // firefox, etc.
            document.addEventListener("mousedown", function(e) { return mouseDown(e) }, true);
            document.addEventListener("mousemove", function(e) { return mouseMove(e) }, true);
            document.addEventListener("mouseup", function(e) { return mouseUp(e) }, true);
        }
        else {
            // IE
            document.onmousedown = function() { mouseDown(window.event) };
            document.onmousemove = function() { mouseMove(window.event) };
            document.onmouseup = function() { mouseUp(window.event) };
        }
    }
    else {
        if (document.body.addEventListener) {
            // firefox, etc.
            remove.addEventListener("mousedown", function(e) { return mouseDown(e) }, true);
            remove.addEventListener("mousemove", function(e) { return mouseMove(e) }, true);
            remove.addEventListener("mouseup", function(e) { return mouseUp(e) }, true);
        }
        else {
            // IE
            // Be careful here. If you have other code that sets these events,
            // you'll want this code here to restore the values to your other handlers,
            // rather than just clear them out.
            document.onmousedown = null;
            document.onmousemove = null;
            document.onmouseup = null;
        }
    }
}
