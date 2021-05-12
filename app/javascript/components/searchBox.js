
let scrollObject = {};
const scrhElmem = document.getElementById('src-bx')
const getScrollPosition = () =>{
    scrollObject = {
       x: window.pageXOffset,
       y: window.pageYOffset
    }
    if(scrollObject.y >  339) {
        scrhElmem.style.display = "block";
    } else {
        scrhElmem.style.display = "none";
    }
}


const showHideSearchBox = () =>{
    window.addEventListener("scroll", (e) => {
        getScrollPosition();    
    })
}




export { showHideSearchBox };
