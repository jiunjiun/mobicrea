$(function(){
  var _fixheaderH = $('#pageHeader').outerHeight()
  if ($('#pageHeader').hasClass("fixed")) {
    fixedHolder(_fixheaderH)
  }
  $( window ).resize(function(){
    _fixheaderH = $('#pageHeader').outerHeight()
    fixedHolder(_fixheaderH)
  })
  function fixedHolder(h){
    if ($("#headerHolder").length) {
       $('#headerHolder').height(h)
    } else {
      $( "body" ).prepend("<div id='headerHolder' style=height:"+h+"px></div>" )
    }
  }

  $(window).scroll(function(){
    var scroll = $(window).scrollTop();
    if (scroll > 5) {
      $("#pageHeader").addClass("is-sticky");
    } else {
      $("#pageHeader").removeClass("is-sticky");
    }
  })

  $('nav#menu').mmenu({
    drag 		: true,
    pageScroll 	: {
      scroll 		: true,
      update		: true
    },
    "extensions"	: [
      "pagedim-black"
    ]
  })

  $().UItoTop({ easingType: 'easeOutQuart' });

  $('.slick-banner').slick({
    dots: true,
    infinite: true,
    speed: 1200,
    // autoplay: true,
    autoplaySpeed: 2500
  })

  $('.logo-wrapper').slick({
    dots: false,
    infinite: true,
    speed: 500,
    slidesToShow: 6,
    slidesToScroll: 6,
    arrows: false,
    centerMode: false,
    responsive: [
     {
       breakpoint: 980,
       settings: {
         slidesToShow: 5,
         slidesToScroll: 5,
       }
     },
     {
       breakpoint: 600,
       settings: {
         centerMode: false,
         slidesToShow: 3,
         slidesToScroll: 3
       }
     },
     {
       breakpoint: 480,
       settings: {
         centerMode: false,
         slidesToShow: 2,
         slidesToScroll: 2
       }
     }
     // You can unslick at a given breakpoint now by adding:
     // settings: "unslick"
     // instead of a settings object
   ]
  });

  $('.case-slick').slick({
    dots: true,
    speed: 500,
    slidesToShow: 4,
    slidesToScroll: 4,
    centerMode: false,
    responsive: [
     {
       breakpoint: 980,
       settings: {
         slidesToShow: 3,
         slidesToScroll: 3,
       }
     },
     {
       breakpoint: 600,
       settings: {
         slidesToShow: 2,
         slidesToScroll: 2
       }
     }
   ]
  });



  $('#productView').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    dots: false,
    asNavFor: '#productThumbnail'
  });
  $('#productThumbnail').slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    asNavFor: '#productView',
    dots: false,
    arrows: false,
    focusOnSelect: true,
    responsive: [
     {
       breakpoint: 980,
       settings: {
         slidesToShow: 3,
         slidesToScroll: 1,
       }
     }
   ]
  });


  $('.dropdown-hover').dropdownHover(100);

  // init Isotope
  var $grid = $('.waterfall').isotope({
    itemSelector: '.element-item',
    layoutMode: 'masonry',
    percentPosition: true,
    masonry: {
      columnWidth: '.grid-sizer'
    }
  })

  // layout Isotope after each image loads
  $grid.imagesLoaded().progress( function() {
    $grid.isotope('layout');
  })

  $grid.on( 'arrangeComplete', function( event, filteredItems ) {
    console.log( 'arrangeComplete with ' + filteredItems.length + ' items' );
  })

  // bind filter button click
  $('.filter-button-group').on( 'click', 'button', function() {
    var filterValue = $( this ).attr('data-filter');
    $grid.isotope({ filter: filterValue });
  })

  // change is-checked class on buttons
  $('.nav-select').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).parent().addClass('is-checked');
    })
  })


  $('#embedMap').click(function () {
    $(this).children("iframe").css("pointer-events", "auto")
  });
  $( "#embedMap" ).mouseleave(function() {
    $(this).children("iframe").css("pointer-events", "none")
  });

  var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
  function addMarker(feature) {
    var marker = new google.maps.Marker({
      icon: iconBase + 'parking_lot_maps.png',
      map: map
    });
  }

});
