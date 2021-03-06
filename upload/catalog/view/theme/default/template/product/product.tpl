<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $cols = 6; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $cols = 9; ?>
    <?php } else { ?>
    <?php $cols = 12; ?>
    <?php } ?>
    <div id="content" class="col-sm-<?php echo $cols; ?>"><?php echo $content_top; ?> 
      
      <!-- Product image -->
      
      <?php if ($thumb || $images) { ?>
      <ul class="thumbnails">
        <?php if ($thumb) { ?>
        <li> <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /> </a> </li>
        <?php } ?>
        <?php if ($images) { ?>
        <?php foreach ($images as $image) { ?>
        <li class="image-additional"> <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /> </a> </li>
        <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
      
      <!-- Tabs --> 
      
      <!-- The Tabs -->
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
        <?php if ($attribute_groups) { ?>
        <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
        <?php } ?>
        <?php if ($review_status) { ?>
        <li><a href="#tab-reviews" data-toggle="tab"><?php echo $tab_review; ?></a></li>
        <?php } ?>
      </ul>
      
      <!-- Tab Content -->
      <div class="tab-content"> 
        
        <!-- Tab - Description -->
        <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
        
        <!-- Tab - Specification -->
        <?php if ($attribute_groups) { ?>
        <div class="tab-pane" id="tab-specification">
          <table class="table table-bordered">
            <?php foreach ($attribute_groups as $attribute_group) { ?>
            <thead>
              <tr>
                <td colspan="2"><?php echo $attribute_group['name']; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
              <tr>
                <td><?php echo $attribute['name']; ?></td>
                <td><?php echo $attribute['text']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
            <?php } ?>
          </table>
        </div>
        <?php } ?>
        
        <!-- Tab - Reviews -->
        <?php if ($review_status) { ?>
        <div class="tab-pane" id="tab-reviews">
          <form class="form-horizontal">
            <div id="review"></div>
            <h2><?php echo $text_write; ?></h2>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="name" value="" id="input-name" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review; ?></label>
              <div class="col-sm-10">
                <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                <div class="help-block"><?php echo $text_note; ?></div>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label"><?php echo $entry_rating; ?></label>
              <div class="col-sm-10"><?php echo $entry_bad; ?>&nbsp;
                <input type="radio" name="rating" value="1" />
                &nbsp;
                <input type="radio" name="rating" value="2" />
                &nbsp;
                <input type="radio" name="rating" value="3" />
                &nbsp;
                <input type="radio" name="rating" value="4" />
                &nbsp;
                <input type="radio" name="rating" value="5" />
                &nbsp;<?php echo $entry_good; ?></div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
              <div class="col-sm-10">
                <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                <img src="index.php?route=product/product/captcha" alt="" id="captcha" /></div>
            </div>
            <div class="buttons">
              <div class="pull-right">
                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
              </div>
            </div>
          </form>
        </div>
        <?php } ?>
      </div>
      
      <!-- Wishlist / Compare buttons -->
      <div class="btn-group">
        <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product_id; ?>');"><i class="fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product_id; ?>');"><i class="fa-exchange"></i></button>
      </div>
      
      <!-- Product Name -->
      <h1><?php echo $heading_title; ?></h1>
      
      <!-- Product Info -->
      <ul class="list-unstyled">
        <?php if ($manufacturer) { ?>
        <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
        <?php } ?>
        <li><?php echo $text_model; ?> <?php echo $model; ?></li>
        <?php if ($reward) { ?>
        <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
        <?php } ?>
        <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
      </ul>
      
      <!-- Price -->
      <?php if ($price) { ?>
      <ul class="list-unstyled">
        <?php if (!$special) { ?>
        <li>
          <h2><?php echo $price; ?></h2>
        </li>
        <?php } else { ?>
        <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
        <li>
          <h2><?php echo $special; ?></h2>
        </li>
        <?php } ?>
        <?php if ($tax) { ?>
        <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
        <?php } ?>
        <?php if ($points) { ?>
        <li><?php echo $text_points; ?> <?php echo $points; ?></li>
        <?php } ?>
        <?php if ($discounts) { ?>
        <li>
          <hr>
        </li>
        <?php foreach ($discounts as $discount) { ?>
        <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
        <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
      <div id="product"> 
        <!-- Options -->
        
        <?php if ($options) { ?>
        <hr>
        <h3><?php echo $text_option; ?></h3>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
              <label>
                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                <?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="checkbox">
              <label>
                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                <?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
              <label>
                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label"><?php echo $option['name']; ?></label>
          <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" class="btn btn-default btn-block"><i class="fa-upload"></i> <?php echo $button_upload; ?></button>
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <input type="date" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <input type="datetime-local" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
          <input type="time" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
        </div>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <div class="form-group">
          <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
          <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
          <button type="button" id="button-cart" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
        </div>
        <?php if ($minimum > 1) { ?>
        <div class="alert alert-info"><i class="fa-info-sign"></i> <?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
      
      <!-- Review -->
      <?php if ($review_status) { ?>
      <div>
        <p><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /> <a onclick="$('a[href=\'#tab-reviews\']').trigger('click');"><?php echo $reviews; ?></a> <a class="review-button" onclick="$('a[href=\'#tab-reviews\']').trigger('click');"><?php echo $text_write; ?></a> </p>
        <hr>
        
        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
        <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script> 
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
        <!-- AddThis Button END --> 
      </div>
      <?php } ?>
      
      <!-- Related products -->
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="col-sm-3">
          <div class="product-thumb transition">
            <?php if ($product['thumb']) { ?>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
            <?php } else { ?>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="catalog/view/theme/default/image/placeholder.png" alt="<?php echo $product['name']; ?>" /></a></div>
            <?php } ?>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
              <?php if ($product['rating']) { ?>
              <img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
              <?php } ?>
            </div>
            <div class="button-group"><a class="add-to-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');"> <span class="hidden-tablet"><?php echo $button_cart; ?></span><span><i class="fa-shopping-cart visible-tablet"></i></span> </a> <a data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa-heart"></i></a> <a data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa-exchange"></i></a>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
        dataType: 'json',
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['error']) {
                if (json['error']['option']) {
                    for (i in json['error']['option']) {
                        $('#input-option' + i).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                    }
                }
            } 
            
            if (json['success']) {
                $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    
                $('#cart-total').html(json['total']);
                
                $('html, body').animate({ scrollTop: 0 }, 'slow'); 
            }   
        }
    });
});
//--></script> 
<script type="text/javascript"><!--
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=product/product/upload',
			type: 'post',		
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,		
			beforeSend: function() {
				$(node).find('i').replaceWith('<i class="fa-spinner fa-spin"></i>');
				$(node).prop('disabled', true);
			},
			complete: function() {
				$(node).find('i').replaceWith('<i class="fa-upload"></i>');
				$(node).prop('disabled', false);			
			},		
			success: function(json) {
				if (json['error']) {
					$(node).parent().find('input[name^=\'option\']').after('<div class="text-danger">' + json['error'] + '</div>');
				}
							
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input[name^=\'option\']').attr('value', json['file']);
				}
			},			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();
	
    $('#review').fadeOut('slow');
        
    $('#review').load(this.href);
    
    $('#review').fadeIn('slow');
});         

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
    $.ajax({
        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
        type: 'post',
        dataType: 'json',
        data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
        beforeSend: function() {
            $('#button-review').button('loading');
        },
        complete: function() {
            $('#button-review').button('reset');
        },
        success: function(json) {
			$('.alert-success, .alert-danger').remove();
            
			if (json['error']) {
                $('#review').after('<div class="alert alert-danger"><i class="fa-exclamation-sign"></i> ' + json['error'] + '</div>');
            }
            
            if (json['success']) {
                $('#review').after('<div class="alert alert-success"><i class="fa-ok-sign"></i> ' + json['success'] + '</div>');
                                
                $('input[name=\'name\']').val('');
                $('textarea[name=\'text\']').val('');
                $('input[name=\'rating\']:checked').prop('checked', false);
                $('input[name=\'captcha\']').val('');
            }
        }
    });
});
//--></script> 
<?php echo $footer; ?>