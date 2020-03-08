$(document).ready(function(){

    let $btns = $('.product-area .button-group button');

    // let $grid = $('.grid');
    // $grid.isotope();
    //위에거랑 같은 역할인거 같은데 초기화
    //$('.product-area .button-group #btn1').trigger('click');
    
    $btns.click(function(e){

        $('.product-area .button-group button').removeClass('active');
        e.target.classList.add('active');

        let selector = $(e.target).attr('data-filter');
        $('.product-area .grid').isotope({
            filter: selector
        });

        return false;
    });

    let $grid = $('.grid');
    $grid.isotope();

});

window.onload = function () {
    $('.product-area .button-group #btn1').trigger('click');
   }

///////////////////////////////////////
function numberFormat(inputNumber) {
    return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
 }