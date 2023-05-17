let b = document.getElementsByClassName("imgbox");
let dot = document.getElementsByClassName("dots");
let bl = b.length;
let dotl = dot.length;
let slideIndex = 0;
let bool = 1;

document.getElementById("left").addEventListener("click", reduceClick);
document.getElementById("right").addEventListener("click", pulsClick);
// document.getElementById("stopbtn").addEventListener("click", srbtn);

moveSlide(slideIndex);

function pulsClick(n) {
    moveSlide(slideIndex +1);
}

function reduceClick(n) {
    moveSlide(slideIndex -1);
}

function moveSlide(n) {
    for(let i = 0 ; i < bl ; i++ ) {//隱藏全部圖片
        b[i].style.display="none";
    }

    for(let i = 0 ; i < dotl ; i++) {//隱藏所有點.active效果
        dot[i].className = dot[i].className.replace(" active","");
    }

    if(n > bl) {//判斷圖片張數是否符合
        n = 1;
    }
    if(n < 1) {
        n = bl-1;
    }
    b[n-1].style.display="block";//顯示
    dot[n-1].className += " active";//加入當前索引點
    slideIndex = n;//累加
}

function auto() {
        timers = setInterval(function() {//循環+鍵
            function pulsClick(n) {
                moveSlide(slideIndex +1);
            }pulsClick();
        },1500)
    }auto();


function stop() {//暫停
clearInterval(timers);
document.getElementById("stopbtn").src = "/images/meteoriterun.png";
}

function run() {//繼續
    document.getElementById("stopbtn").src = "/images/meteorite.png"
    auto();    
}

function srbtn() {//點擊呼叫stop、run
  
    if (bool == 1) {
        stop();
        bool=0;
    }
    else{
        run();
        bool=1;
    }
}


function currentSlide(n) {//點
    slideIndex = n;
    moveSlide(slideIndex);
    console.log(n);
    clearInterval(timers);
    auto();
}

	