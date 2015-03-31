function _getAllFilesFromFolder (cat) {
    //var filesystem = require("fs");
    var results = null;
    var data1 = {categorie:""+cat}
    
    $.ajax({
        url: "listAllFilebyCategoryAction.ecom",
        data: data1,
        dataType: 'json',
        contentType: 'application/json',
        type: 'GET',
        async: true,
        success: function (res) {
        	
        	setProduct(res);
        	/*alert(res.lists);
        	 * console.log(res.data.length);
            results = res.lists;*/
            
        },
        error: function (request, status, errorThrown) {
            alert(request+"--"+status+"--"+errorThrown);
        }
    });
/*
    filesystem.readdirSync(categorie).forEach(function(file) {

        file = categorie+'/'+file;
        var stat = filesystem.statSync(file);

        if (stat && stat.isDirectory()) {
            results = results.concat(_getAllFilesFromFolder(file));
        } else results.push(file);

    });
*/
    return results;

};





function buildByCathegorie(cathegorie){
		
	var files = _getAllFilesFromFolder(cathegorie);
}
function setProduct(res){

var _htmlresult = "" ;
for (var i = 0, f; f = res.lists[i]; i++) {
	_htmlresult=_htmlresult+'\n'
	+'<li><a class="item" href="#"  draggable="true">'
	+'<img src="images/'+res.categorie+'/'+f+'"  />'
	+'<div>'
	+'<p><strong>'+f+'</strong></p>'
	+'<p><strong>Price</strong>: <span>$1199.00</span></p>'
	+'<p><strong>Quantity</strong>: <span>10</span></p>'
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