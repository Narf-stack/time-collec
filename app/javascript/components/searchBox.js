
let scrollObject = {};
const scrhElmem = document.getElementById('src-bx')
const backgroundIndexShop = document.querySelector('.top-index-page')
const scrhElmemHomePage = document.getElementById('div-search-box-home')


const getScrollPosition = () =>{
    scrollObject = {
       x: window.pageXOffset,
       y: window.pageYOffset
    }
    if(scrollObject.y >  453) {
        scrhElmem.style.display = "block";
        scrhElmemHomePage.setAttribute('style', 'display:none !important');
    } else {
        scrhElmem.style.display = "none";
        scrhElmemHomePage.setAttribute('style', 'display:flex !important');
    }
}


const showHideSearchBox = () =>{
    if(backgroundIndexShop){
        window.addEventListener("scroll", (e) => {
            getScrollPosition();    
        })
    }
}




export { showHideSearchBox };
