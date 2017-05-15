function change(obj, dir)

{

    var ulobj = obj.parentNode.parentNode.nextSibling;

    if (typeof(ulobj) != "undefined" && ulobj.tagName == "UL")

    {

        if (ulobj.style.display == "none")

        {

            obj.children[0].children[0].src = dir + "image/tree_open.gif";

            ulobj.style.display = "block";

        }

        else

        {

            obj.children[0].children[0].src = dir + "image/tree_close.gif";

            ulobj.style.display = "none";

        }

    }

}



function collapseTree()

{

    /*    var frm = window.parent.frames;

    for (i=0; i < frm.length; i++) 

        alert(frm(i).name);

    var obj = event.srcElement.parentNode.parentNode.parentNode;

    alert(obj.tagName);*/

//    alert(window.frameElement.width);

    if (window.frameElement.width > 100)

    {

        document.all.Tree.style.overflow = "hidden";

        document.all.menuText.innerText = "";

        window.frameElement.parentElement.cols = "25, *";

    }

    else        

    {

        document.all.Tree.style.overflow = "auto";

        document.all.menuText.innerText = "²Ëµ¥À¸";

        window.frameElement.parentElement.cols = "150, *";

    }

}

