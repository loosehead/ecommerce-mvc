function _getAllFilesFromFolder (cat, subcat) {
    //var filesystem = require("fs");
    var results = null;
    var data1 = {"categoryName": cat, "subcategoryName":subcat};
    
    
    $.ajax({
        url: "/allProductBySubcategoryName",
        data: JSON.stringify(data1),
        type: "GET",
         
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
        success: function(product) {
            var respContent = "";
             
          //setProduct(res);
        	alert(res.lists);
        	 /* console.log(res.data.length);
            results = res.lists;*/
             
            $("#sPhoneFromResponse").html(respContent);         
        },
        error: function (request, status, errorThrown) {
            alert(request+"--"+status+"--"+errorThrown);
        }
        
    });
      
    
    return results;

};





function buildByCathegorie(cat, subcat){
		
	var files = _getAllFilesFromFolder(cat, subcat);
}
function setProduct(res){

var _htmlresult = "" ;
for (var i = 0, f; f = res.lists[i]; i++) {
	_htmlresult=_htmlresult+'\n'
	+'<li><a class="item" href="#"  draggable="true">'
	+'<img src="images/'+f.categorie+'/'+f.imagePath+'"  />'
	+'<div>'
	+'<p><strong>'+f.producName+'</strong></p>'
	+'<p><strong>'+f.price+'</strong>: <span>$1199.00</span></p>'
	+'<p><strong>'+f.quantity+'</strong>: <span>10</span></p>'
	+'</div>'
    +'</a></li>';
	
	
    /*output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                f.size, ' bytes, last modified: ',
                f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                '</li>');*/
}

alert (_htmlresult);
$("#products").append(_htmlresult);

refreshDragAndDrop();
};



function refreshDragAndDrop(){
	
	
	$('.item')
	.bind('dragstart', function (evt) {
		evt.dataTransfer.setData('text', this.id);
		$('h2').fadeIn('fast');
	})
	.hover(
		function () { $('div', this).fadeIn(); }, 
		function () { $('div', this).fadeOut(); }
	);
	
$('#cart')
	.bind('dragover', function (evt) {
		evt.preventDefault();
	})
	.bind('dragenter', function (evt) {
		evt.preventDefault();
	})
	.bind('drop', function (evt) {
		var id = evt.dataTransfer.getData('text'),
			item = $('#' + id),
			cartList = $("#cart ul"),
			total = $("#total span"),
			price = $('p:eq(1) span', item).text(),
			prevCartItem = null,
			notInCart = (function () {
				var lis = $('li', cartList),
					len = lis.length,
					i;

				for (i = 0; i < len; i++ ) {
					var temp = $(lis[i]);
					if (temp.data('id') === id) {
						prevCartItem = temp;
						return false;
					}
				}
				return true;
			} ()),
			quantLeftEl, quantBoughtEl, quantLeft;

		$("h2").fadeOut('fast');

		if (notInCart) {
			prevCartItem = $('<li />', {
				text : $('p:first', item).text(),
				data : { id : id }
			}).prepend($('<span />', {
				'class' : 'quantity',
				text : '0'
			})).prepend($('<span />', {
				'class' : 'price',
				text : price
			})).appendTo(cartList);
		}

		quantLeftEl = $('p:last span', item);
		quantLeft   = parseInt(quantLeftEl.text(), 10) - 1;
		quantBoughtEl = $('.quantity', prevCartItem);
		quantBoughtEl.text(parseInt(quantBoughtEl.text(), 10) + 1);
		quantLeftEl.text(quantLeft);

		if (quantLeft === 0) {
			item.fadeOut('fast');
		}

		total.text((parseFloat(total.text(), 10) + parseFloat(price.split('$')[1])).toFixed(2));

		evt.stopPropagation();
		return false;
	});
	
}